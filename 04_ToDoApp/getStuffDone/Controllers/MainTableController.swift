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
    
 
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        
        
        let edit = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            print("hey, you just clicked edit")
            // TODO: Call Alert controller to update text
        }
        
        return [delete, edit]
    }
    
    func editTableRow() {
        
    }

 
 override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) ->     }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to 
}
