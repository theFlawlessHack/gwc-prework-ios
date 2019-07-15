# Info App

This is an informational app designed to introduce students to Xcode and setting up screens within a storyboard file.

## Code Analysis
Within this section, files which have a deep code line by line analysis
* [Gif Controller](https://github.com/thetealpickle/gwc-student-resources/blob/master/01_InfoApp/infoapp/Controller/GifController.swift): Showing a Gif through a WKWebView

## Key Lessons
Within this section, key points to keep in mind to recreate this application.

### Segues
Segues are used to create a transition between view controllers. 
Segues are created within the storyboard file with higher level segue management through code.

<b>To create a segue from button object to controller: </b>
1. Select the button which will trigger the action for the transition
2. Hold down the Ctrl button 
3. While still holding down the Ctrl button drag from the button to the desired transition controller
4. Release the Ctrl button and the `Manual Segue` Menu will pop up.	

From here, the type of segue to create can be selected from the menu. <br><br>

<b>To create a segue from one controller to another controller: </b>
1. Select the yellow circle on the top bar of the view controller and drag to the desired transition controller
2. Release and the `Manual Segue` Menu will pop up.	<br>

🎉 Yay, you did. 🎉
To confirm this, you will see an arrow pop up from the button's controller to the desired transition controller. 

## Extensions
Extensions are refactors and additional features students can implement should time allow.
Extension topics which will be covered in further detail during the week will be given a summary and redirection link.

### Custom Controller Class
Once storyboard objects need to be connected to code a custom controller class will need to be created.
Custom controller classes allow a tailored in-sync storyboard screen to controller code flow, adding more functionality to the objects and app flow.

Interface Builder Outlets and Actions are covered in futher detail on [Day 02](https://github.com/thetealpickle/gwc-student-resources/blob/master/02_RecommendApp/README.md#iboutlets-and-ibactions)
