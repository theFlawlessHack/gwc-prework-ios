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

    // MARK: Class Variables and Constants
    // questions array which holds all questions for the quiz
    // within the array a Question model is created using the default memberwise initializer
    let questions: [Question] = [
        Question(title: "What do minions wear?", answers: ["t-shirt and pants", "overalls", "blouse and a skirt", "nothing"], correctAnswer: 1),
        Question(title: "What do minions eat?", answers: ["papaya", "air", "grapes", "bananas"], correctAnswer: 3),
        Question(title: "What color are evil minions?", answers: ["teal", "blue", "purple", "yellow"], correctAnswer: 2)
    ]
    
    // currentQuestion holds the Question model of the current question
    var currentQuestion: Question?
    
    // currentIndex holds the position of the current queston within the questions array
    var currentIndex: Int = 0
    
    // correctAnswers hold the number of correct answers the user selected throughout the quiz
    var correctAnswers: Int = 0
    
    // MARK: Overridden Class Methods
    // These are methods this controller inherits since it is a subclass or child class of the UIViewController class
    
    // The method called once the view associated with this controller has loaded
    override func viewDidLoad() {
        super.viewDidLoad()

        // calling the setQuestion method to set the view with the initial question
        setQuestion()
    }
    
    // The method called once the performSegue(withIdentifier:sender:) method is called
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // comparing the segue parameter identifier with the identifier associated with this project's result controller
        if segue.identifier == "showResults" {
            // create a constant with the segue destination as a ResultController
            // by doing this, data can be transferred from the Quiz controller variables to the ResultController variable
            
            // as! force unwraps the segue's destination to be a ResultsController class
            let controller = segue.destination as! ResultsController
            
            // updating the results controller variables with the data from this(quiz) controller
            controller.numberCorrect = correctAnswers
            controller.total = questions.count
        }
    }
    
    // MARK: Class Methods
    // setQuestion() updates the Quiz controller screen(view) with the data from the currentQuestion
    // If there are no more questions a segue is performed
    func setQuestion(){
        // checking the currentIndex to assure within the bounds of the questions array
        if currentIndex < questions.count {
            
            // setting the currentQuestion variable with the Question model from the questions array
            currentQuestion = questions[currentIndex]
            
            // set the text of the question label with the title of the current question
            questionLabel.text = currentQuestion?.title
            
            // set the title of the  answer choice buttons with the corresponding answer choice from the current questions answers array
            // utilizing the .normal control state to set the title for the button's normal state
            answer0.setTitle(currentQuestion?.answers[0], for: .normal)
            answer1.setTitle(currentQuestion?.answers[1], for: .normal)
            answer2.setTitle(currentQuestion?.answers[2], for: .normal)
            answer3.setTitle(currentQuestion?.answers[3], for: .normal)
            
            // set the progress label text using string interpolation and passing in the current index and total question count
            // the current index is being added by 1 to conform to the "non techie" way of counting (starting from 1)
            progressLabel.text = "\(currentIndex + 1)/\(questions.count)"
            
        } else {
            // if the currentIndex is not within the bounds of the questions array we are at the end of the array and the results controller should be shown
            // performing a segue and passing in the identifier which was defined on the segue w/in the storyboard
            performSegue(withIdentifier: "showResults", sender: self)
        }
    }
    
    // nextQuestion() increases the currentIndex by 1 and then calls the setQuestion() method
    func nextQuestion(){
        currentIndex += 1
        setQuestion()
    }
    
    // checkAnswer(index:) checks whether the selected answer was the correct answer and then calls the nextQuestion() method
    func checkAnswer(index: Int) {
        // if the correctAnswer from the currentQuestion is equal to the index parameter increase the number of correct answers
        if currentQuestion?.correctAnswer == index {
            correctAnswers += 1 // correctAnswers = correctAnswers + 1
        }
        
        // call the nextQuestion() method
        nextQuestion()
    }
    
    // MARK: Interface Builder Actions (Methods)
    // Call the check answer method and pass in the associated index for each selection
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
