//
//  StorybookClass.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/27/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

public class Storybook {
    
    var accent: String;
    var pageImgFormat: String;
    var splashImgFormat: String;
    var analytics: Bool;
    var mathJax: Bool;
    var version: String;
    var setup: Setup;
    var sections: Array<Section>;
    
    init( accent: String, imgFormat: String, splashFormat: String, analytics: Bool, mathJax: Bool, setup: Setup, sections: Array<Section>, version: String ) {
        
        self.accent = accent;
        self.pageImgFormat = imgFormat;
        self.splashImgFormat = splashFormat;
        self.analytics = analytics;
        self.mathJax = mathJax;
        self.setup = setup;
        self.sections = sections;
        self.version = version;
        
    }
    
    convenience init( setup: Setup, sections: Array<Section>, version: String ) {
        
        self.init( accent: "", imgFormat: "png", splashFormat: "svg", analytics: false, mathJax: false, setup: setup, sections: sections, version: version );
        
    }
    
}
