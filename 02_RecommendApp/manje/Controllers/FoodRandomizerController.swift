//  Created by Jessica Joseph on 7/9/19.
//  Copyright © 2019 TFH. All rights reserved.


// MARK: Import Frameworks
// UIKit (User Interface Kit), the Apple provided framework for UI elements
import UIKit

// MARK: Introduction
/*
 The FoodRandomizerController handles the randomizing functionality for this project.
 Setting and randomizing Food Item Images.
 
 This controller is structured by having a list of food items which are the names of the images within the Assests folder.
 The names within the array are randomized and then the returned name is used to create an image.
 This created image is then set as the image for the main image view outlet connection within the storyboard.
 */
class FoodRandomizerController: UIViewController {

    // MARK: Interface Builder Variables
    // The mainImageView outlet connects the the imageview set on the storyboard for this controller
    @IBOutlet weak var mainImageView: UIImageView!
    
    // MARK: Class Constants and Variables
    // foodItems is an array which holds the name of the associated image within the Assets folder
    let foodItems = ["apple", "cupcake", "icecream", "pineapple", "pizza", "sandwich", "taco"]
    
    // MARK: Overridden Class Methods
    // These are methods this controller inherits since it is a subclass or child class of the UIViewController class
    
    // The method called once the view associated with this controller has loaded
    override func viewDidLoad() {
        super.viewDidLoad()

        // Calling the setRandomImage() method once the view has loaded
        setRandomImage()
    }
    
    // Method which is called when a motion is detected with the device
    // For example shaking the device
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        // Calling the setRandomImage() method once a motion with the device has started
        setRandomImage()
    }
    
    // MARK: Class Methods
    // setRandomImage() retrieves a random element from the foodItems array and then uses the retrieved element
    // to create and image and then set that image as the image on the image view
    func setRandomImage() {
        // The .randomElement() returns an Optional element
        /* An optional element can have a value or it can be nil. To assure we are accessing a value and not nil (which would cause a runtime error)
           A guard statement is used to set the element to the constant item if there is a value otherwise if there is no value it will return
           ending the function call
        */
        
        // A runtime error is an error which occurs while you are actively using the application
        // for example you click a button and the app crashes (runtime error)
        guard let item = foodItems.randomElement() else { return }
        
        // imageview's have a settable image property, we use this to set the property to the newly created Image object (UIImage)
        // utilizing the name received randomly from the foodItems array
        mainImageView.image = UIImage(named: item)
    }
    
    // MARK: Interface Builder Actions (Methods)
    // anotherOne(_:) sets the imageview image to another random image
    @IBAction func anotherOne(_ sender: Any) {
        
        // Calling the setRandomImage() method when the button has been pressed
        setRandomImage()
    }
}
