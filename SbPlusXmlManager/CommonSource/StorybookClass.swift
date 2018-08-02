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
    
    convenience public init( accent: String, imgFormat: String, splashFormat: String, analytics: Bool, mathJax: Bool, version: String ) {
        
        self.init( accent: accent, imgFormat: imgFormat, splashFormat: splashFormat, analytics: analytics, mathJax: mathJax, setup: Setup(), sections: [], version: version );
        
    }
    
    public func toString() -> String {
        return self.accent + " | " + self.pageImgFormat + " | " + self.splashImgFormat + " | " + self.analytics.description + " | " + self.mathJax.description + " | " +  self.version + " | " + self.setup.program + " | " + self.setup.course + " | " + self.setup.title + " | " + self.setup.subtitle + " | " + self.setup.length + " | " + self.setup.authorName + " | " + self.setup.authorProfile + " | " + self.setup.generalInfo;
    }
    
    public func setSetup( setup: Setup ) {
        self.setup = setup;
    }
    
}

public struct Setup {
    
    private var _program: String = "";
    private var _course:String = "";
    private var _title:String = "";
    private var _subtitle:String = "";
    private var _length: String = "";
    private var _authorName:String = "";
    private var _authorProfile:String = "";
    private var _generalInfo:String = "";
    
    var program: String {
        
        get {
            
            return self._program;
            
        }
        
        set {
            self._program = newValue;
        }
        
    };
    
    var course: String {
        
        get {
            
            return self._course;
            
        }
        
        set {
            self._course = newValue;
        }
        
    };
    var title: String {
        
        get {
            
            return self._title;
            
        }
        
        set {
            self._title = newValue;
        }
        
    };
    
    var subtitle: String {
        
        get {
            
            return self._subtitle;
            
        }
        
        set {
            self._subtitle = newValue;
        }
        
    };
    
    var length: String {
        
        get {
            
            return self._length;
            
        }
        
        set {
            self._length = newValue;
        }
        
    };
    
    var authorName: String {
        
        get {
            
            return self._authorName;
            
        }
        
        set {
            self._authorName = newValue;
        }
        
    };
    
    var authorProfile: String {
        
        get {
            
            return self._authorProfile;
            
        }
        
        set {
            self._authorProfile = newValue;
        }
        
    };
    
    var generalInfo: String {
        
        get {
            
            return self._generalInfo;
            
        }
        
        set {
            self._generalInfo = newValue;
        }
        
    };
    
}

public struct Section {
    
    var name: String?;
    var pages: Array<Page>;
    
}

public class Page {
    
    var type: String;
    var src: String;
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
