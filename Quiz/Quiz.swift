//
//  Quiz.swift
//  Quiz
//
//  Created by UCode on 1/6/18.
//  Copyright © 2018 Nick Inc. All rights reserved.
//

import Foundation

class Quiz {
    
    var score: Int
    let questions: [Question]
    var currentQuestionIndex: Int
    var currentQuestionNumber: Int {
        return currentQuestionIndex + 1
    }
    
    var currentQuestion: Question {
        return questions[currentQuestionIndex]
    }
    
    init(questions: [Question]) {
        score = 0
        self.questions = questions
        currentQuestionIndex = 0
    }
    
}
