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
    
    var xmlPath: String = "";
    var xmlString: String = "";
    var sbXml: Storybook?;
    var foundCharacters: String = "";
    
    init( path: String ) {
        self.xmlPath = path;
    }
    
    func readXml() throws {
        self.xmlString = try String( contentsOf: NSURL( string: self.xmlPath )! as URL );
    }
    
    func parseXml() {
        
        let xmlData = self.xmlString.data(using: String.Encoding.utf8, allowLossyConversion: true )!;
        let parser = XMLParser( data: xmlData );
        
        parser.delegate = self;
        parser.parse();
        
    }
    
    func getXmlString() -> String {
        
        return self.xmlString;
        
    }
    
    func parser( _: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] ) {
        
        if ( elementName == "storybook" ) {
            
            let accent: String? = attributeDict["accent"];
            let imgFormat: String? = attributeDict["pageImgFormat"];
            let splashFormat: String? = attributeDict["splashImgFormat"];
            var analytics: Bool = false;
            var mathjax: Bool = false;
            
            if let analyticsAttr: String = attributeDict["analytics"] {
                
                if ( analyticsAttr.lowercased() == "yes" || analyticsAttr.lowercased() == "true" || analyticsAttr.lowercased() == "on" ) {
                    analytics = true;
                }
                
            }
            
            if let mathjaxAttr: String = attributeDict["mathjax"] {
                
                if ( mathjaxAttr.lowercased() == "yes" || mathjaxAttr.lowercased() == "true" || mathjaxAttr.lowercased() == "on" ) {
                    mathjax = true;
                }
                
            }
            
            let version: String? = attributeDict["xmlVersion"];
            
            if ( self.sbXml == nil ) {
                
                self.sbXml = Storybook( accent: accent!, imgFormat: imgFormat!, splashFormat: splashFormat!, analytics: analytics, mathJax: mathjax, version: version! );
                
                print("SB+: \(self.sbXml!.toString())");
                
            }
            
        }
        
    }
    
    func parser( _: XMLParser, foundCharacters string: String) {
        self.foundCharacters += string;
    }
    
    func parser( _: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
    
    }
    
    func parserDidStartDocument( _: XMLParser ) {
        print("started");
    }
    
    func parserDidEndDocument( _: XMLParser ) {
        print("ended");
    }
    
    func getSbXml() throws -> Storybook {
        //let xmlData = try self.getXMLContent();
        return self.sbXml!;
    }
    
}
