//
//  ParserClass.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/21/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

// tutorial http://leaks.wanari.com/2016/08/24/xml-parsing-swift/

import Foundation

class SbXmlParser {
    
    var xmlPath: String;
    var sbXml: Storybook?;
    
    init( path: String ) {
        self.xmlPath = path;
    }
    
    func test() -> String {
        return "SbXmlParser is working!";
    }
    
    func getSbXml() -> Storybook {
        return self.sbXml!;
    }
    
}
