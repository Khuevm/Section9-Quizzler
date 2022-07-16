//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Khue on 07/07/2022.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var correctAnswer: String
    var answer: [String]
    
    init(q: String, a: [String], correctAnswer: String){
        self.text = q
        self.answer = a
        self.correctAnswer = correctAnswer
    }
}
