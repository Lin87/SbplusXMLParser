//
//  SbXmlManager.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/28/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

public class SbXmlManager {
    
    var reader: SbXmlReader?;
    var storybook: Storybook?;
    
    public init() {}
    
    public func read( path: String ) throws {
        
        self.reader = SbXmlReader( path: path );
        try self.reader!.readXml();
        
    }
    
    public func parse() {

        self.reader!.parseXml();

    }
    
    public func getXmlString() -> String {
        
        return self.reader!.getXmlString();
        
    }
    
    public func write( path: String, storybook: Storybook ) {
        
        let writer: SbXmlWriter = SbXmlWriter( path: path, storybook: storybook );
        
        self.storybook = writer.getSbXml();
        
    }
    
}
