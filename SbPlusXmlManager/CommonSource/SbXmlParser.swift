//
//  SbXmlParser.swift
//  SbXmlParser
//
//  Created by Ethan Lin on 6/28/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

public class SbXmlParser {
    
    public init() {}
    
    public func read( path: URL ) throws -> StorybookXml {
        
        let reader: SbXmlReader = try SbXmlReader(path: path)
        reader.parseXml()
        
        return reader.getSbXmlObj()
        
    }
    
    public func parse(xmlString: String) -> StorybookXml {
        
        let reader = SbXmlReader(xml: xmlString);
        reader.parseXml()
        
        return reader.getSbXmlObj()
        
    }
    
}
