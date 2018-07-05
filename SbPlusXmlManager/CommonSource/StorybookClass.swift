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
    
    public init( accent: String, imgFormat: String, splashFormat: String, analytics: Bool, mathJax: Bool, setup: Setup, sections: Array<Section>, version: String ) {
        
        self.accent = accent;
        self.pageImgFormat = imgFormat;
        self.splashImgFormat = splashFormat;
        self.analytics = analytics;
        self.mathJax = mathJax;
        self.setup = setup;
        self.sections = sections;
        self.version = version;
        
    }
    
    convenience public init( setup: Setup, sections: Array<Section>, version: String ) {
        
        self.init( accent: "", imgFormat: "png", splashFormat: "svg", analytics: false, mathJax: false, setup: setup, sections: sections, version: version );
        
    }
    
}

public struct Setup {
    
    var program: String?;
    var course: String?;
    var title: String;
    var subtitle: String;
    var length: String;
    var authorName: String;
    var authorProfile: String?;
    var generalInfo: String?;
    
}

public struct Section {
    
    var name: String?;
    var pages: Array<Page>;
    
}

public class Page {
    
    var type: String;
    var src: String?;
    var title: String;
    var transition: String?;
    var notes: String?;
    var widget: Array<Segment>?;
    
    public init( type: String, src: String, title: String, transition: String, notes: String, widget: Array<Segment> ) {
        
        self.type = type;
        self.src = src;
        self.title = title;
        self.transition = transition;
        self.notes = notes;
        self.widget = widget;
        
    }
    
    convenience public init( type: String, src: String, title: String ) {
        
        self.init( type: type, src: src, title: title, transition: "", notes: "", widget: [Segment]() );
        
    }
    
    convenience public init( type: String, src: String, title: String, transition: String ) {
        
        self.init( type: type, src: src, title: title, transition: transition, notes: "", widget: [Segment]() );
        
    }
    
}

public struct Segment {
    
    var name: String;
    var content: String;
    
}
