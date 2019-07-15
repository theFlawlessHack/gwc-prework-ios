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
        // create a cell from a prototype cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath)
        cell.textLabel?.text = tasks[indexPath.row].taskName

        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            let task = self.tasks[indexPath.row]
            self.context.delete(task)
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            self.tasks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        return [delete]
    }
    
    func editTableRow() {
        
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
