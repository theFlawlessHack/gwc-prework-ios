//  Created by Jessica Joseph on 6/13/18.
//  Copyright © 2018 TFH. All rights reserved.

// MARK: Import Frameworks
// UIKit (User Interface Kit), the Apple provided framework for UI elements
// CoreData, the Apple provided framework for managing models
import CoreData
import UIKit

// MARK: Introduction
/*
 The MainTableController extends the Table View Controller and handles the displaying of the the data from the persistent Container
 
 This controller is structured by having a list of task which is populated by fetching the data from the persistent Container.
 The data is then shown within the tableview. This controller also extends the method to edit the cell actions.
 */
class MainTableController: UITableViewController {

    // MARK: Class Variables and Constants
    // context refers to the context within the App Delegate's persistent container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // an array to hold the Task objects 
    var tasks: [Task] = []
    
    // MARK: Overridden Class Methods
    // This method is called once the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // This method is called once the view has appeared
    override func viewDidAppear(_ animated: Bool) {
        // calling the getData() method
        getData()
    }

    // MARK: Table view data source
    // This method defines the number of sections to display within the table view 
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // This method defines the number of rows within the sections
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // returning the number of rows within the section as the number of Task from the tasks array
        return tasks.count
    }
    
    // This method defines the cell to return for the row
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a cell from a prototype cell defined on the storyboard
        // the cell has the identifier associated with the identifier defined for the cell on storyboard
        // tableviewcell identifiers can be added within the Utilities Pane - Attribute Inspector
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
     
        // set the default cell text label text to the taskName attribute on the Task object at the position of the indexpath row within the tasks array
        // for example indexPath row 2 would refer to the Task object at tasks[2]
        // the property taskName was define in the .xcmodel file as an attribute
        cell.textLabel?.text = tasks[indexPath.row].taskName
        
        // cell customization complete, returning the cell to be added to the table view 
        return cell
    }
    
    // This method is called when defining what actions are available for a cell when the user swipes right to left on a cell
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // creating a delete action
        // the title that will appear for the action is 'Delete'
        // within the handler is the action that is associated with this row action option
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            // access the Task object at the indexpath.row position within the tasks array
            let task = self.tasks[indexPath.row]
                                                                             
            // referencing the delete method of the context constant created above and passing in the Task object accessed above
            self.context.delete(task)
            
            // update the new context state (w/o the deleted Task object) by saving the contexgt directly on the App Delegate                                                               
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.tasks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
    }
    

    // MARK: Class Methods
    // getData() retrieves the data from the persistent container as it pertains to the Task model
    func getData() {
        // executing a do-catch to handle the possible error of a failed data fetch 
        do {
            // try to fetch the data related to the Task model and set that to the tasks variable if the fetch succeeds
            tasks = try context.fetch(Task.fetchRequest()
                                      
            // From this point the data fetch was successful, the remainder of the do block will execute
                                      
            // Asynchronously update the tableview's view
            // DispatchQueue is used to handle threads
            DispatchQueue.main.async {
                // reload the tableview data
                // reloadData() causes the data source methods to be recalled
                // the tableview variable was not explicitly defined, however because this class extends the UITableViewController this class also inherits this property
                self.tableView.reloadData()
            }
        } catch {
            // If the data fetching was NOT successful the catch block will immediately execute
            // the do-catch block prevents your app from simply crashing and is a method of error handling
            // For more information on error handling, see the Error Handling section of Apple's Swift Programming Language Guide
            
            // print an error message to the console
            print("Couldn't fetch Data")
        }
    }
}
