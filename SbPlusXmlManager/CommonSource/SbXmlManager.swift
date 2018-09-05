//
//  SbXmlManager.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/28/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

public class SbXmlManager {
    
    var reader: SbXmlReader?
    
    public init() {}
    
    public func read( path: String ) throws -> String {
        
        var result: String = "";
        
        self.reader = SbXmlReader( path: path )
        try self.reader!.readXml()
        self.reader!.parseXml()
        
        #if os( OSX )
        result = (try XMLDocument( xmlString: self.reader!.getXmlString(), options: XMLNode.Options.documentTidyXML ).xmlString )
        #elseif ( iOS )
        result = self.reader!.getXmlString()
        #endif
        
        return result
        
    }
    
    public func write( path: URL, content: String ) throws {
        
        #if os( OSX )
        
        let xmlString = try XMLDocument( xmlString: content, options: XMLNode.Options.documentTidyXML )
        try xmlString.xmlString.write( to: path, atomically: true, encoding: .utf8 )
        
        #endif
        
    }
    
}
