# To Do App

This is a to do list  app designed to introduce students to Table Views and Core Data.

## Key Lessons
Within this section, key points to keep in mind to recreate this application.

### Core Data 
Core Data is Apple's framework for managing the model layer of your application.<br>
Core Data is powerful for allowing app to persistently store data. Regardless of whether the app is wiped out or the device is restarted, data saved with Core Data can be retrieved.<br><br> 

To enable Core Data, select the `Use Core Data` checkbox when creating your application

#### App Delegate
In using Core Data we start to dive into the App Delegate.<br>
The App Delegate is the middle manager between the device and the application.<br>
The App Delegate is what lets your app know whether the app is about to get stopped, just got clicked, etc. Managing the relay of information of the device interaction with the overall app.

#### Retrieving and Saving Data
1. Create an Entity within the .xcmodel file
2. Switch over to your controller's .swift file you can `import CoreData` into your file and then handle the saving and fetching of your data
3. Access your AppDelegate's persistentContainer viewContext property and setting it to a context constant which will be used for fetch
```
let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
```
4. For Retrieving
	* call the fetch method on the context and pass into the function a fetchRequest on the model you want to retrieve data from
5. For Saving
	* create a new model instance, passing in the context into the parameter of the Task
	* setting values to the model's attributes
	* save the context on your delegate
```
(UIApplication.shared.delegate as! AppDelegate).saveContext()
```
### Table View
A TableView creates a list like view. 
