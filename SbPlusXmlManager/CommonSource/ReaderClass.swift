//
//  ParserClass.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/21/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

// tutorial http://leaks.wanari.com/2016/08/24/xml-parsing-swift/

import Foundation

class SbXmlReader: NSObject, XMLParserDelegate {
    
    var xmlPath: String = ""
    var xmlString: String = ""
    var sbXml: StorybookXml?
    var sbXmlSetup: Setup = Setup()
    var foundCharacters: String = ""
    
    private var _tempSection: Section = Section()
    private var _tempPageArray: Array<Page> = []
    private var _tempPage: Page = Page()
    private var _tempSegment: Segment = Segment()
    private var _tempFrame: String = ""
    
    init( path: String ) {
        
        self.xmlPath = path
        
    }
    
    func readXml() throws {
        
        self.xmlString = try String( contentsOf: NSURL( string: self.xmlPath )! as URL )
        
    }
    
    func parseXml() {
        
        let xmlData = self.xmlString.data(using: String.Encoding.utf8, allowLossyConversion: true )!
        let parser = XMLParser( data: xmlData )
        
        parser.delegate = self
        parser.parse()
        
    }
    
    func getXmlString() -> String {
        
        return self.xmlString
        
    }
    
    func parser( _: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] ) {
        
        // get attributes from the storybook element
        if ( elementName == "storybook" ) {
            
            let accent: String? = attributeDict["accent"]
            let imgFormat: String? = attributeDict["pageImgFormat"]
            let splashFormat: String? = attributeDict["splashImgFormat"]
            var analytics: Bool = false
            var mathjax: Bool = false
            
            if let analyticsAttr: String = attributeDict["analytics"] {
                
                if ( analyticsAttr.lowercased() == "yes" || analyticsAttr.lowercased() == "true" || analyticsAttr.lowercased() == "on" ) {
                    
                    analytics = true
                    
                }
                
            }
            
            if let mathjaxAttr: String = attributeDict["mathjax"] {
                
                if ( mathjaxAttr.lowercased() == "yes" || mathjaxAttr.lowercased() == "true" || mathjaxAttr.lowercased() == "on" ) {
                    
                    mathjax = true
                    
                }
                
            }
            
            let version: String? = attributeDict["xmlVersion"]
            
            if ( self.sbXml == nil ) {
                
                self.sbXml = StorybookXml( accent: accent!, imgFormat: imgFormat!, splashFormat: splashFormat!, analytics: analytics, mathJax: mathjax, xmlVersion: version! )
                
            }
            
        }
        
        if ( elementName == "setup" ) {
            
            let program: String? = attributeDict["program"]
            let course: String? = attributeDict["course"]
            
            self.sbXmlSetup.program = program!
            self.sbXmlSetup.course = course!
            
        }
        
        if ( elementName == "author" ) {
            
            let name: String? = attributeDict["name"]
            
            self.sbXmlSetup.authorName = name!
            
        }
        
        if ( elementName == "section" ) {
            
            let title: String? = attributeDict["title"]
            
            self._tempSection.title = title!
            
        }
        
        if ( elementName == "page" ) {
            
            let type: String? = attributeDict["type"]
            let title: String? = attributeDict["title"]
            
            if ( type! != "quiz" ) {
                
                let src: String? = attributeDict["src"]
                let transition: String? = attributeDict["transition"]
                
                self._tempPage.src = src!
                
                if ( transition != nil ) {
                    
                    self._tempPage.transition = transition!
                    
                }
                
            }
            
            self._tempPage.type = type!
            self._tempPage.title = title!
            
        }
        
        if ( elementName == "segment" ) {
            
            let name: String? = attributeDict["name"]
            
            self._tempSegment.name = name!
            
        }
        
        if ( elementName == "frame" ) {
            
            let start: String? = attributeDict["start"]
            
            self._tempFrame = start!
            
        }
        
    }
    
    func parser( _: XMLParser, foundCharacters string: String) {
        
        self.foundCharacters += string.trimmingCharacters(in: .whitespacesAndNewlines)
        
    }
    
    func parser( _: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        
        if ( elementName == "title" ) {
            
            self.sbXmlSetup.title = self.foundCharacters
            
        }
        
        if ( elementName == "subtitle" ) {
            
            self.sbXmlSetup.subtitle = self.foundCharacters
            
        }
        
        if ( elementName == "length" ) {
            
            self.sbXmlSetup.length = self.foundCharacters
            
        }
        
        if ( elementName == "author" ) {
            
            self.sbXmlSetup.authorProfile = self.foundCharacters
            
        }
        
        if ( elementName == "generalInfo" ) {
            
            self.sbXmlSetup.generalInfo = self.foundCharacters
            
        }
        
        if ( elementName == "section" ) {
            
            self._tempSection.pages = self._tempPageArray
            self.sbXml?.addSection( section: self._tempSection )
            self._tempPageArray.removeAll()
            self._tempSection = Section()
            
        }
        
        if ( elementName == "page" ) {
            
            self._tempPageArray.append( self._tempPage )
            self._tempPage = Page()
            
        }
        
        if ( elementName == "note" ) {
            
            self._tempPage.notes = self.foundCharacters
            
        }
        
        if ( elementName == "segment" ) {
            
            self._tempSegment.content = self.foundCharacters
            self._tempPage.addSegment( segment: self._tempSegment )
            self._tempSegment = Segment()
            
        }
        
        if ( elementName == "frame" ) {
            
            self._tempPage.addFrame( frame: self._tempFrame )
            self._tempFrame = ""
            
        }
        
        self.foundCharacters = ""
        
    }
    
    func parserDidStartDocument( _: XMLParser ) {
        //print("started")
    }
    
    func parserDidEndDocument( _: XMLParser ) {
        
        if ( self.sbXml != nil ) {
            self.sbXml!.setSetup( setup: self.sbXmlSetup )
        }
        
    }
    
    func getSbXml() -> StorybookXml {
        
        return self.sbXml!
        
    }
    
}
