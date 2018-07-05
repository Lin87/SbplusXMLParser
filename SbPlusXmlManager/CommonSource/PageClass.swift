//
//  Page.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/27/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

class Page {
    
    var type: String;
    var src: String?;
    var title: String;
    var transition: String?;
    var notes: String?;
    var widget: Array<Segment>?;
    
    init( type: String, src: String, title: String, transition: String, notes: String, widget: Array<Segment> ) {
        
        self.type = type;
        self.src = src;
        self.title = title;
        self.transition = transition;
        self.notes = notes;
        self.widget = widget;
        
    }
    
    convenience init( type: String, src: String, title: String ) {
        
        self.init( type: type, src: src, title: title, transition: "", notes: "", widget: [Segment]() );
        
    }
    
    convenience init( type: String, src: String, title: String, transition: String ) {
        
        self.init( type: type, src: src, title: title, transition: transition, notes: "", widget: [Segment]() );
        
    }
    
}
