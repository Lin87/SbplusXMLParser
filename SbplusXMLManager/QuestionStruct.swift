//
//  QuizItemStruct.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/28/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

protocol QuestionProtocol {
    func generatorXML() -> String;
}

struct Question {
    
    var question: String;
    var image: String?;
    var audio: String?;
    var answers: Answer;
    var feedback: Feedback?;
    
}

struct Answer {
    
    var value: String;
    var image: String?
    var audio: String?;
    var correct: Bool;
    var feedback: Feedback;
    
}

struct Feedback {
    
    var simple: String?;
    var correct: String?;
    var incorrect: String?;
    
}

struct ShortAnswer: QuestionProtocol {
    
    var question: Question;
    
    init( question: Question ) {
        self.question = question;
    }
    
    func generatorXML() -> String {
        return "";
    }
    
}

struct FillInTheBlank: QuestionProtocol {
    
    var question: Question;
    
    init( question: Question ) {
        self.question = question;
    }
    
    func generatorXML() -> String {
        return "";
    }
    
}
