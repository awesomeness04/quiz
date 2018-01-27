//
//  ResultsViewController.swift
//  Quiz
//
//  Created by UCode on 1/27/18.
//  Copyright © 2018 Nick Inc. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quiz: Quiz!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showResults()
    }
    
    func showResults() {
        scoreLabel.text = String(quiz.score)
    }

}
