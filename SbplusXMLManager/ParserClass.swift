//
//  ParserClass.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/21/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

// tutorial http://leaks.wanari.com/2016/08/24/xml-parsing-swift/

import Foundation

public class SbXmlManager {
    
    var xmlPath: String;
    var sbXml: Storybook?;
    
    required public init( path: String ) {
        self.xmlPath = path;
    }
    
    public func test() -> String {
        return "SbXmlManager is working!";
    }
    
}
