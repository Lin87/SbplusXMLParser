//
//  QuestionClass.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/27/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

public class Quiz: Page {
    
    var questionDelegate: QuestionProtocol;
    
    public init( type: String, title: String, question: Question, transition: String ) {
        
        self.questionDelegate = QuizFactory.getQuestion( type: type, question: question );
        
        super.init();
        
    }
    
}

public protocol QuestionProtocol {
    func generatorXML() -> String;
}

public struct Question {
    
    var question: String;
    var image: String?;
    var audio: String?;
    var answers: Answer;
    var feedback: Feedback?;
    
}

public struct Answer {
    
    var value: String;
    var image: String?
    var audio: String?;
    var correct: Bool;
    var feedback: Feedback;
    
}

public struct Feedback {
    
    var simple: String?;
    var correct: String?;
    var incorrect: String?;
    
}

public struct ShortAnswer: QuestionProtocol {
    
    var question: Question;
    
    public init( question: Question ) {
        self.question = question;
    }
    
    public func generatorXML() -> String {
        return "";
    }
    
}

public struct FillInTheBlank: QuestionProtocol {
    
    var question: Question;
    
    public init( question: Question ) {
        self.question = question;
    }
    
    public func generatorXML() -> String {
        return "";
    }
    
}
