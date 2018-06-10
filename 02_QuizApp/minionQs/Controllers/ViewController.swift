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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitAnswer0(_ sender: Any) {
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
    }
    
    @IBAction func submitAnswer3(_ sender: Any) {
    }
}

