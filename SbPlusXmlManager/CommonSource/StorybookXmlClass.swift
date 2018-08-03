//
//  StorybookXmlClass.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/27/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

public class StorybookXml {
    
    var accent: String
    var pageImgFormat: String
    var splashImgFormat: String
    var analytics: Bool
    var mathJax: Bool
    var version: String
    var setup: Setup
    var sections: Array<Section>
    
    public init( accent: String, imgFormat: String, splashFormat: String, analytics: Bool, mathJax: Bool, setup: Setup, sections: Array<Section>, version: String ) {
        
        self.accent = accent
        self.pageImgFormat = imgFormat
        self.splashImgFormat = splashFormat
        self.analytics = analytics
        self.mathJax = mathJax
        self.setup = setup
        self.sections = sections
        self.version = version
        
    }
    
    convenience public init( setup: Setup, sections: Array<Section>, version: String ) {
        
        self.init( accent: "", imgFormat: "png", splashFormat: "svg", analytics: false, mathJax: false, setup: setup, sections: sections, version: version )
        
    }
    
    convenience public init( accent: String, imgFormat: String, splashFormat: String, analytics: Bool, mathJax: Bool, version: String ) {
        
        self.init( accent: accent, imgFormat: imgFormat, splashFormat: splashFormat, analytics: analytics, mathJax: mathJax, setup: Setup(), sections: [], version: version )
        
    }
    
    public func toString() -> String {
        
        return self.accent + " | " + self.pageImgFormat + " | " + self.splashImgFormat + " | " + self.analytics.description + " | " + self.mathJax.description + " | " +  self.version + " | " + self.setup.program + " | " + self.setup.course + " | " + self.setup.title + " | " + self.setup.subtitle + " | " + self.setup.length + " | " + self.setup.authorName + " >> " + self.setup.authorProfile + " | " + self.setup.generalInfo + "\n" + self.getSectionString()
        
    }
    
    public func getSectionString() -> String {
        
        var sectionString: String = ""
        var count = 0;
        
        for section in self.sections {
            
            count += 1
            sectionString += "Section \( count ): " + section.title + "\n"
            
            for page in section.pages {
                
                sectionString += page.type + " | " + page.src + " | " + page.title + " | " + page.transition  + " | " + page.notes  + " | "
                
                for segment in page.widget {
                    
                    sectionString += segment.name + " >> " + segment.content + " | "
                    
                }
                
                for frame in page.frames {
                    
                    sectionString += frame.start + " | "
                    
                }
                
                sectionString += "\n\n"
                
            }
            
        }
        
        return sectionString
        
    }
    
    public func setSetup( setup: Setup ) {
        
        self.setup = setup
        
    }
    
    public func addSection( section: Section ) {
        
        self.sections.append( section )
        
    }
    
}

public struct Setup {
    
    private var _program: String = ""
    private var _course:String = ""
    private var _title:String = ""
    private var _subtitle:String = ""
    private var _length: String = ""
    private var _authorName:String = ""
    private var _authorProfile:String = ""
    private var _generalInfo:String = ""
    
    var program: String {
        
        get {
            
            return self._program
            
        }
        
        set {
            
            self._program = newValue
            
        }
        
    }
    
    var course: String {
        
        get {
            
            return self._course
            
        }
        
        set {
            
            self._course = newValue
            
        }
        
    }
    var title: String {
        
        get {
            
            return self._title
            
        }
        
        set {
            
            self._title = newValue
            
        }
        
    }
    
    var subtitle: String {
        
        get {
            
            return self._subtitle
            
        }
        
        set {
            
            self._subtitle = newValue
            
        }
        
    }
    
    var length: String {
        
        get {
            
            return self._length
            
        }
        
        set {
            
            self._length = newValue
            
        }
        
    }
    
    var authorName: String {
        
        get {
            
            return self._authorName
            
        }
        
        set {
            
            self._authorName = newValue
            
        }
        
    }
    
    var authorProfile: String {
        
        get {
            
            return self._authorProfile
            
        }
        
        set {
            
            self._authorProfile = newValue
            
        }
        
    }
    
    var generalInfo: String {
        
        get {
            
            return self._generalInfo
            
        }
        
        set {
            
            self._generalInfo = newValue
            
        }
        
    }
    
}

public struct Section {
    
    private var _title: String = ""
    private var _pages: Array<Page> = []
    
    var title: String {
        
        get {
            
            return self._title
            
        }
        
        set {
            
            self._title = newValue
            
        }
        
    }
    
    var pages: Array<Page> {
        
        get {
            
            return self._pages
            
        }
        
        set {
            
            self._pages = newValue
            
        }
        
    }
    
}

public class Page {
    
    private var _type: String = ""
    private var _src: String = ""
    private var _title: String = ""
    private var _transition: String = ""
    private var _notes: String = ""
    private var _widget: Array<Segment> = []
    private var _frames: Array<Frame> = []
    
    var type: String {
        
        get {
            
            return self._type
            
        }
        
        set {
            
            self._type = newValue
            
        }
        
    }
    
    var src: String {
        
        get {
            
            return self._src
            
        }
        
        set {
            
            self._src = newValue
            
        }
        
    }
    
    var title: String {
        
        get {
            
            return self._title
            
        }
        
        set {
            
            self._title = newValue
            
        }
        
    }
    
    var transition: String {
        
        get {
            
            return self._transition
            
        }
        
        set {
            
            self._transition = newValue
            
        }
        
    }
    
    var notes: String {
        
        get {
            
            return self._notes
            
        }
        
        set {
            
            self._notes = newValue
            
        }
        
    }
    
    var widget: Array<Segment> {
        
        get {
            
            return self._widget
            
        }
        
    }
    
    var frames: Array<Frame> {
        
        get {
            
            return self._frames
            
        }
        
    }
    
    public init() { }
    
    public func addSegment( segment: Segment ) {
        
        self._widget.append( segment )
        
    }
    
    public func addFrame( frame: Frame ) {
        
        self._frames.append( frame )
        
    }
    
}

public struct Segment {
    
    private var _name: String = ""
    private var _content: String = ""
    
    var name: String {
        
        get {
            
            return self._name
            
        }
        
        set {
            
            self._name = newValue
            
        }
        
    }
    
    var content: String {
        
        get {
            
            return self._content
            
        }
        
        set {
            
            self._content = newValue
            
        }
        
    }
    
}

public struct Frame {
    
    private var _start: String = ""
    
    var start: String {
        
        get {
            
            return self._start
            
        }
        
        set {
            
            self._start = newValue
            
        }
        
    }
    
}
