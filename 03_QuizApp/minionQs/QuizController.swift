//  Created by Jessica Joseph on 7/10/19.
//  Copyright © 2019 TFH. All rights reserved.

// MARK: Import Frameworks
// UIKit (User Interface Kit), the Apple provided framework for UI elements
import UIKit

// MARK: Introduction
/*
 The QuizController handles the core quiz functionality for this app.
 Setting Questions, Setting/Showing the Next Question, and Showing the Result Controller once all questions have been answered.
 
 This controller is structured by having a qeustions array which is comprised of an array of Question's.
 * Witin the controller class, the Question model is defined* There is a variable to the currentQuestion which is used to refer to the current Question model.
 
 Outlets and Actions are created for the number of answer choices available
 The setQuestion() method updates the view with the current Question model
 The nextQuestion() method, shows the next question if there is another question to show, otherwise
 presents the results controller.
 */
class QuizController: UIViewController {

    // MARK: Internal Model Definitions
    // Defining the Question model within the QuizController restricts its usage to within this controller
    // This model could have been defined outside of the QuizController to make it globally available
    struct Question {
        // a Question's title is immutable and not able to be changed once set
        let title: String
        // a Question has an array of possible answer choice, one of which will be the correct answer
        var answers: [String]
        // a Question has a correctAnswer which refers to the position (index) of the correct answer within the answers array
        var correctAnswer: Int
        
        // The design choice to make answer and correctAnswers variables as opposed to constants
        // allows for hte support of updating the question with additional possible 'wrong' answers after creation and the subsequently updating the corrent answer
    }
    
    // MARK: Interface Builder Variables
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
