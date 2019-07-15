//  Created by Jessica Joseph on 6/13/18.
//  Copyright © 2018 TFH. All rights reserved.

// MARK: Import Frameworks
// UIKit (User Interface Kit), the Apple provided framework for UI elements
// CoreData, the Apple provided framework for managing models
import CoreData
import UIKit

// MARK: Introduction
/*
 The MainTableCotnrller handles the randomizing functionality for this project.
 Setting and randomizing Food Item Images.
 
 This controller is structured by having a list of food items which are the names of the images within the Assests folder.
 The names within the array are randomized and then the returned name is used to create an image.
 This created image is then set as the image for the main image view outlet connection within the storyboard.
 */
class MainTableController: UITableViewController {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        getData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func getData() {
        do {
            tasks = try context.fetch(Task.fetchRequest())
            print(tasks)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        } catch {
            print("Couldn't fetch Data")
        }
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
    
    /*
     
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
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
        // Pass the selected object to the new view controller.
    }
    */

}
