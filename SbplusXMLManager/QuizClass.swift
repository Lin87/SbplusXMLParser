//
//  QuestionClass.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/27/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

class Quiz: Page {
    
    var question: Question;
    var answer: Answer;
    var feedback: Feedback?;
    
    init( type: String, title: String, question: Question, answer: Answer, feedback: Feedback, transition: String ) {
        
        self.question = question;
        self.answer = answer;
        self.feedback = feedback;
        
        super.init(type: type, src: "", title: title, transition: transition, notes: "", widget: [Segment]() );
        
    }
    
}
