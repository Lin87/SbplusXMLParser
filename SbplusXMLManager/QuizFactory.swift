//
//  QuizFactory.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/28/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

class QuizFactory {
    
    static func getQuestion( type: String, question: Question ) -> QuestionProtocol {
        
        switch type {
            case "ShortAnswer":
                return ShortAnswer( question: question );
            
            case "FillInTheBlank":
                return FillInTheBlank( question: question );
            
            default:
                return ShortAnswer( question: question );
        }
        
    }
    
}
