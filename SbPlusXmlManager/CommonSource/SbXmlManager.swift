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
        
        self.reader = SbXmlReader( path: path )
        try self.reader!.readXml()
        self.reader!.parseXml()
        
        return self.reader!.getXmlString()
        
    }
    
    public func write( path: URL, content: String ) throws {
        
        try content.write( to: path, atomically: true, encoding: .utf8 )
        
    }
    
}
