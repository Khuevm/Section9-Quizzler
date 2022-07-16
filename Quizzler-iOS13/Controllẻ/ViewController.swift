//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateUI()
    }
    
    @IBAction func answerButtonDidTap(_ sender: UIButton) {
        let userAnswer = sender.title(for: .normal)!
        
        if quizBrain.checkAnswer(userAnswer: userAnswer) {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.updateUI()
        }
        
    }
    
    func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        aButton.setTitle(quizBrain.getQuestionChoices()[0], for: .normal)
        bButton.setTitle(quizBrain.getQuestionChoices()[1], for: .normal)
        cButton.setTitle(quizBrain.getQuestionChoices()[2], for: .normal)
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        aButton.backgroundColor = .clear
        bButton.backgroundColor = .clear
        cButton.backgroundColor = .clear
    }
}

