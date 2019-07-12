//
//  QuizController.swift
//  minionQs
//
//  Created by Jessica Joseph on 7/10/19.
//  Copyright © 2019 TFH. All rights reserved.
//

import UIKit

struct Question {
    var title: String
    var answers: [String]
    var correctAnswer: Int
}

class QuizController: UIViewController {

    // MARK: Interface Builder Constants
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    let questions: [Question] = [
        Question(title: "What do minions wear?", answers: ["t-shirt and pants", "overalls", "blouse and a skirt", "nothing"], correctAnswer: 1),
        Question(title: "What do minions eat?", answers: ["papaya", "air", "grapes", "bananas"], correctAnswer: 3),
        Question(title: "What color are evil minions?", answers: ["teal", "blue", "purple", "yellow"], correctAnswer: 2)
    ]
    
    var currentQuestion: Question?
    var currentIndex: Int = 0
    
    // MARK: Overridden Class Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setQuestion()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResults" {
            let controller = segue.destination as! ResultsController
            controller.numberCorrect = correctAnswers
            controller.total = questions.count
        }
    }
    
    func setQuestion(){
        if currentIndex < questions.count {
            
            currentQuestion = questions[currentIndex]
            
            questionLabel.text = currentQuestion?.title
            answer0.setTitle(currentQuestion?.answers[0], for: .normal)
            answer1.setTitle(currentQuestion?.answers[1], for: .normal)
            answer2.setTitle(currentQuestion?.answers[2], for: .normal)
            answer3.setTitle(currentQuestion?.answers[3], for: .normal)
            progressLabel.text = "\(currentIndex + 1)/\(questions.count)"
            
        } else {
            performSegue(withIdentifier: "showResults", sender: self)
        }
    }
    
    func nextQuestion(){
        currentIndex += 1
        setQuestion()
    }
    
    var correctAnswers: Int = 0
    
    func checkAnswer(index: Int) {
        if currentQuestion?.correctAnswer == index {
            correctAnswers += 1 // correctAnswers = correctAnswers + 1
        }
        nextQuestion()
    }
    
    // MARK: Interface Builder Actions (Methods)
    @IBAction func answer0(_ sender: Any) {
        checkAnswer(index: 0)
    }
    
    @IBAction func answer1(_ sender: Any) {
        checkAnswer(index: 1)
    }
    
    @IBAction func answer2(_ sender: Any) {
        checkAnswer(index: 2)
    }
    
    @IBAction func answer3(_ sender: Any) {
        checkAnswer(index: 3)
    }
}
