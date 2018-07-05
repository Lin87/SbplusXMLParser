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
    
    var xmlPath: String;
    var sbXml: Storybook?;
    
    init( path: String ) {
        self.xmlPath = path;
    }
    
    func getSbXml() -> Storybook {
        return self.sbXml!;
    }
    
    func getPath() -> String {
        return self.xmlPath;
    }
    
}
