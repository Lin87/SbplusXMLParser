//
//  ParserClass.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/21/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

// tutorial http://leaks.wanari.com/2016/08/24/xml-parsing-swift/

import Foundation

class SbXmlReader {
    
    var xmlPath: String = "";
    var sbXml: Storybook?;
    
    init( path: String ) {
        self.xmlPath = path;
    }
    
    func getXMLContent() throws -> String {
        
        #if os( iOS )
        
        let xmlContent = try String( contentsOf: NSURL( string: self.xmlPath )! as URL );
        return xmlContent;
        
        #elseif os( OSX )
        
        let fileManager = FileManager.default;
        let userHomeDirectory = fileManager.homeDirectoryForCurrentUser;
        let xmlUrl = userHomeDirectory.appendingPathComponent( self.xmlPath );
        
        let xmlContent = try String( contentsOf: xmlUrl, encoding: .utf8 );
        return xmlContent;
        
        #endif
        
    }
    
    func getSbXml() throws -> Storybook {
        //let xmlData = try self.getXMLContent();
        return self.sbXml!;
    }
    
}
