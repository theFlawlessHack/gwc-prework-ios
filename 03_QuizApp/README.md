# Quiz App

This is a quiz based app designed to introduce students to managing segues through code and model creation.

- - - -
## Key Lessons
Within this section, key points to keep in mind to recreate this application.

### Model Layer
The Model layer is used to hold the data for the application. Within the Model layer, the structure to hold the data is created and maintained.<br>
Models are usually created as a Structure. Creating a model is creating a custom Type which can then be used throughout our project (based on the default access level).<br><br>

Swift has two types Value types and Reference Types.<br>
Value types: changes to the value type such as copying to another variable/constant and the sort result to new objects being created.<br>
Reference types: copying to another variable/constant resuls in copying a reference to the same underlying object.<br><br>

Swift structures are a value type. Unlike C-based languages, Swift Structures are much more powerful with their capabilities aligning more closely with classes.<br><br>

An example structure modeling a Student is shown below.
```
struct Student {
	let name: String
	var nicknames: [String]
	var age: Int
	var favoriteColor: String
	var hobbies: [String]
}

```
In the Student model,<br>
`name` is a constant typed as a String - a Student has one nonchanging **assuming the person does not take legal steps to change their name 🙃🙃<br>
`nickname` is a variable typed as an array of String - a Student can have  more than one nickname at the same time<br>
`age` is an a variable typed as an Int<br>
`favoriteColor` is a variable typed as a String<br>
`hobbies` is a variable typed as an array of String - a student can have multiple hobbies at the same time

This Student model can be used throughout the application as a standard Type.<br>
To create a Student object/instance call the Student model with the default memberwise intializer. An example of this is below<br><br>

```
var student1 = Student(name: "Jessica", nicknames: ["Jess", "Jay", "Baldy"], age: 22, favoriteColor: "yellow", hobbies: ["coding", "weight lifting", "videography"] )
```

An intializer is used to provide all class/structure properties with an initial value at creation.<br>
A memberwise initializer is provided automatically by Swift for Structures which do not explicitly define an initializer.<br>

### Segue Managemenet - Transferring Data Between Screens

When you create a segue exclusively on storyboard you can extend its management to code.<br>
Extending segue management to code is useful when passing data between screens. 

HOW?:
1. Create your segue from your inital controller view to the next controller view [[REFERENCE]](https://github.com/thetealpickle/gwc-student-resources/tree/master/01_InfoApp#segues)
2. Click on your segue, the arrow connection between the two screens
3. In the Utilities Pane - Attributes Inspector give your segue an identifier	
	* This identifier is how we reference this specific segue within code 
4. In your intial controller .swift file within the method or IBAction you want to trigger the segue you will call the performSegue method and give it the identifier you created above
5. Within your overall class code block you will override the performSegue method and you can begin passing your data around

An example of calling the performSegue method and 
```
import UIKit

class FirstController: UIViewController {
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "COPIED_SEGUE_ID" {
            		let controller = segue.destination as! SecondController
        	}
	}

	@IBAction func someNextButton(_ sender: UIButton) {
		performSegue(withIdentifier: "COPIED_SEGUE_ID", sender: self)
	}
}
```

A deeper code analysis can found within this project's [QuizController.swift](https://github.com/thetealpickle/gwc-student-resources/blob/master/03_QuizApp/minionQs/QuizController.swift) file
