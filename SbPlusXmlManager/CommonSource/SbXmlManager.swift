//
//  SbXmlManager.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/28/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

public class SbXmlManager {
    
    var storybook: Storybook?;
    
    public init() {}
    
    public func read( path: String ) -> String {
        
        let reader:SbXmlReader = SbXmlReader( path: path );
        
        //self.storybook = reader.getSbXml();
        
        return reader.getPath();
        
    }
    
    public func write( path: String, storybook: Storybook ) {
        
        let writer: SbXmlWriter = SbXmlWriter( path: path, storybook: storybook );
        
        self.storybook = writer.getSbXml();
        
    }
    
}
