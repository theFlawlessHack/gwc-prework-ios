//
//  ViewController.swift
//  minionQs
//
//  Created by Jessica Joseph on 6/10/18.
//  Copyright © 2018 TFH. All rights reserved.
//

import UIKit

struct Question {
    let question: String
    let answers: [String]
    let correntAnswer: Int
}

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    var questions: [Question] = [
        Question(question: "What is a Minions' favorite food?", answers: ["ice cream", "bananas", "pizza", "bread"], correntAnswer: 1),
        Question(question: "How many fingers do Minions have?", answers: ["Five", "One", "Four", "Three"], correntAnswer: 3),
        Question(question: "What color are evil Minions?", answers: ["Purple", "Orange", "Yellow", "Blue"], correntAnswer: 0)
    ]
    
    var currentQuestion: Question?
    var currentQuestionPosition: Int = 0
    
    var numberCorrect: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        currentQuestion = questions[0]
        setQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sgShowResults" {
            let controller = segue.destination as! ResultsController
            controller.numberCorrect = numberCorrect
            controller.total = questions.count
        }
    }

    func setQuestion() {
        questionLabel.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
        progressLabel.text = "Question: \(currentQuestionPosition + 1)/ \(questions.count)"
    }
    
    func loadNextQuestion() {
        if currentQuestionPosition + 1 < questions.count {
            currentQuestionPosition += 1
            currentQuestion = questions[currentQuestionPosition]
            setQuestion()
        } else {
            performSegue(withIdentifier: "sgShowResults", sender: nil)
        }
    }
    
    func checkAnswer(index: Int) {
        if index == currentQuestion!.correntAnswer {
            numberCorrect += 1
        }
        
        loadNextQuestion()
    }

    @IBAction func submitAnswer0(_ sender: Any) {
        checkAnswer(index: 0)
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
        checkAnswer(index: 1)
    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
        checkAnswer(index: 2)
    }
    
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(index: 3)
    }
}

