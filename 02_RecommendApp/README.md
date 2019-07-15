# Recommendation App

This is a recommendation based app designed to introduce students to Swift and how to create those teis.

## Key Lessons
Within this section, key points to keep in mind to recreate this application.

## Code Analysis
Within this section, files which have a deep code line by line analysis
* [Food Randomization Controller](https://github.com/thetealpickle/gwc-student-resources/blob/master/02_RecommendApp/manje/Controllers/FoodRandomizerController.swift): Randomly setting an image on a View on button click and by shaking the device

### IBOutlets and IBActions

IBOutlets are references made to the code to access an object as if it were a properties. <br>
Creating an IBOutlet allows the code to reference elements in your app’s UI (like buttons, text fields, images, etc.)<br><br>

IBActions are triggered actions from a view object.<br>
Creating an IBAction connects a function to an element in the view controller allowing the corresponding code to execute when the user takes an action on a specific element.<br><br>

To create an IBOutlet/IBAction: 
1. Navigate to your Storyboard and click on the screen to connect
2. Click on the Intersecting Venn Diagram button at the top to open the assistant editor
3. Select the object which you want to create the outlet or action for
2. Hold down the Ctrl button 
3. While still holding down the Ctrl button drag from the button to the code in the assistant editor
4. Release the Ctrl button and the `Connections` Menu will pop up
5. Name your connection and Viola

🎉 Yay, you did. 🎉
To confirm this, you will see a filled in circle next to the newly created connection.<br>
Hovering over this circle will highlight the object that outlet or action is connected to.<br> 

<b>Note:</b><br>
When you create a Connection you will be given two or three options depending on the object and it's capable function.<br>
The three possible connections: outlet, outlet collection, and action.<br><br>
The outlet option will be available for all elements, while the action option will be available for button/button related objects.

### Randomization
Randomization has been significantly simplified with Swift 5.0. Reducing the action to a method call on the array to select the random method from.

```
let greetings = ["hello", "hi", "bonjour", "ni hao", "what's up"]
let someGreeting = greetings.randomElement() // returns a optional random element and assigns it to the constant someGreeting
```

### Optionals
Optionals are a core Swift feature which allows the compiler to safely handle nil cases.<br>
Optionals in Swift tell the compiler, there is a value and it is XYZ or there is no value

