//
//  WriterClass.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/28/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

class SbXmlWriter {
    
    var xmlDestination: String;
    var sbXml: StorybookXml;
    
     init( path: String, storybook: StorybookXml ) {
        
        self.xmlDestination = path;
        self.sbXml = storybook;
        
    }
    
    func getSbXml() -> StorybookXml {
        
        return self.sbXml;
        
    }
    
}
