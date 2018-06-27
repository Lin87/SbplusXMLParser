//
//  AnswerStruct.swift
//  SbplusXMLManager
//
//  Created by Ethan Lin on 6/27/18.
//  Copyright © 2018 University of Wisconsin System Office of Academic and Student Affairs. All rights reserved.
//

import Foundation

struct Answer {
    
    var value: String;
    var image: String?
    var audio: String?;
    var correct: Bool;
    var feedback: Feedback;
    
}
