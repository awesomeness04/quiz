//
//  ViewController.swift
//  Quiz
//
//  Created by UCode on 1/6/18.
//  Copyright © 2018 Nick Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerA: UIButton!
    @IBOutlet var answerB: UIButton!
    @IBOutlet var answerC: UIButton!
    @IBOutlet var answerD: UIButton!
    
    
    let quiz = Quiz(questions: [Question(text: "What year is it?", answers: [Answer(text: "2015", isCorrect: false), Answer(text: "2016", isCorrect: false), Answer(text: "2017", isCorrect: false), Answer(text: "2018", isCorrect: true)])])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questionLabel.text = quiz.questions[0].text
        questionLabel.sizeToFit();
        
        answerA.setTitle("A. \(quiz.currentQuestion.answers[0].text)", for: .normal)
        answerB.setTitle("B. \(quiz.currentQuestion.answers[1].text)", for: .normal)
        answerC.setTitle("C. \(quiz.currentQuestion.answers[2].text)", for: .normal)
        answerD.setTitle("D. \(quiz.currentQuestion.answers[3].text)", for: .normal)
        answerA.sizeToFit();
        answerB.sizeToFit();
        answerC.sizeToFit();
        answerD.sizeToFit();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitAnswer (sender: AnyObject) {
        if quiz.currentQuestion.check(answer: sender.tag) {
            quiz.score += 1
            print(quiz.score)
        }
    }

}

