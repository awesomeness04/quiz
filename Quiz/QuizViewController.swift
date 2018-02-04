//
//  QuizViewController.swift
//  Quiz
//
//  Created by UCode on 1/6/18.
//  Copyright © 2018 Nick Inc. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerA: UIButton!
    @IBOutlet var answerB: UIButton!
    @IBOutlet var answerC: UIButton!
    @IBOutlet var answerD: UIButton!
    
    
    let quiz = Quiz(questions: [
        Question(text: "You can buy Green Arrow action figures, plastic bows, and more when you shop at me!", answers: [
            Answer(text: "Book-Off", isCorrect: false),
            Answer(text: "Walmart", isCorrect: false),
            Answer(text: "Toys R Us", isCorrect: false),
            Answer(text: "Target", isCorrect: true)
        ]),
        Question(text: "I'm an NFL team that hates King George III!", answers: [
            Answer(text: "Los Angeles Rams", isCorrect: false),
            Answer(text: "Minnesota Vikings", isCorrect: false),
            Answer(text: "Baltimore Ravens", isCorrect: false),
            Answer(text: "New England Patriots", isCorrect: true)
        ]),
        Question(text: "Physicists are big fans of this modern day company.", answers: [
            Answer(text: "Yahoo", isCorrect: false),
            Answer(text: "Apple", isCorrect: true),
            Answer(text: "Samsung", isCorrect: false),
            Answer(text: "Google", isCorrect: false)
        ]),
        Question(text: "This ruthless MLB team is one of the best right now.", answers: [
            Answer(text: "New York Yankees", isCorrect: true),
            Answer(text: "Los Angeles Dodgers", isCorrect: false),
            Answer(text: "Boston Red Sox", isCorrect: false),
            Answer(text: "Houston Astros", isCorrect: false)
        ]),
        Question(text: "This dazzling NBA team might just surprise you!", answers: [
            Answer(text: "Boston Celtics", isCorrect: false),
            Answer(text: "Oklahoma City Thunder", isCorrect: false),
            Answer(text: "Washington Wizards", isCorrect: true),
            Answer(text: "New York Knicks", isCorrect: false)
        ]),
        Question(text: "Train A is going at 50 miles an hour. Train B is going at 50 kilometers an hour. Which one has more American passengers?", answers: [
            Answer(text: "Train A", isCorrect: true),
            Answer(text: "Train B", isCorrect: false),
            Answer(text: "Both trains", isCorrect: false),
            Answer(text: "None of the trains", isCorrect: false)
        ]),
        Question(text: "Learn the ways of this sport, grasshopper, and you will master the ways of the ninja!", answers: [
            Answer(text: "Tennis", isCorrect: false),
            Answer(text: "Ice Hockey", isCorrect: false),
            Answer(text: "Rugby", isCorrect: false),
            Answer(text: "Cricket", isCorrect: true)
        ]),
        Question(text: "I'm a fast food restaurant where people always go...", answers: [
            Answer(text: "In-N-Out", isCorrect: true),
            Answer(text: "Burger King", isCorrect: false),
            Answer(text: "McDonalds", isCorrect: false),
            Answer(text: "Wendy's", isCorrect: false)
        ]),
        Question(text: "(Read this one carefully) I'm an MLB team who always hits FOUL BALLS, no wonder we're doing so bad!", answers: [
            Answer(text: "Detroit Tigers", isCorrect: false),
            Answer(text: "Colorado Rockies", isCorrect: false),
            Answer(text: "Toronto Blue Jays", isCorrect: true),
            Answer(text: "Milwaukee Brewers", isCorrect: false)
        ]),
        Question(text: "I'm a famous city known for my hardcore (not really) lifestyle.", answers: [
            Answer(text: "Tokyo, Japan", isCorrect: false),
            Answer(text: "New York, New York", isCorrect: true),
            Answer(text: "Paris, France", isCorrect: false),
            Answer(text: "London, England", isCorrect: false)
        ])
    ])
    
    func show(question:Question) {
        
        questionLabel.text = question.text
        
        answerA.setTitle("A. \(question.answers[0].text)", for: .normal)
        answerB.setTitle("B. \(question.answers[1].text)", for: .normal)
        answerC.setTitle("C. \(question.answers[2].text)", for: .normal)
        answerD.setTitle("D. \(question.answers[3].text)", for: .normal)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        show(question: quiz.currentQuestion)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitAnswer (sender: AnyObject) {
        if quiz.currentQuestion.check(answer: sender.tag) {
            quiz.increaseScore()
        }
        if quiz.currentQuestionNumber < quiz.questions.count {
            quiz.next()
            show(question: quiz.currentQuestion)
        }
        else {
            performSegue(withIdentifier: "Show Results", sender: self)
        }
        
    }
    
    @IBAction func unwindToQuizViewController (segue:UIStoryboardSegue) {
        quiz.reset()
        show(question: quiz.currentQuestion)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let resultsViewController = segue.destination as! ResultsViewController
        resultsViewController.quiz = quiz
    }

}

