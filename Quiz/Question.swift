//
//  Question.swift
//  Quiz
//
//  Created by UCode on 1/6/18.
//  Copyright © 2018 Nick Inc. All rights reserved.
//

import Foundation

struct Question {
    
    let text: String
    let answers: [Answer]
    
    func check(answer index: Int) -> Bool {
        return answers[index].isCorrect
    }
    
}
