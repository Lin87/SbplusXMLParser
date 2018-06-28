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
    var sbXml: Storybook;
    
     init( path: String, storybook: Storybook ) {
        
        self.xmlDestination = path;
        self.sbXml = storybook;
        
    }
    
    func test() -> String {
        return "SbXmlParser is working!";
    }
    
    func getSbXml() -> Storybook {
        return self.sbXml;
    }
    
}
