//
//  QuestionClass.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/27/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

class Quiz: Page {
    
    var questionDelegate: QuestionProtocol;
    
    init( type: String, title: String, question: Question, transition: String ) {
        
        self.questionDelegate = QuizFactory.getQuestion( type: type, question: question );
        
        super.init(type: type, src: "", title: title, transition: transition, notes: "", widget: [Segment]() );
        
    }
    
}
