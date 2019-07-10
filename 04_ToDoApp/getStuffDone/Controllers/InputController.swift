//  Created by Jessica Joseph on 6/13/18.
//  Copyright © 2018 TFH. All rights reserved.

import CoreData
import UIKit

class InputController: UIViewController {

    @IBOutlet weak var newItemTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func addNewItem(_ sender: Any) {
        guard newItemTextField.text != "" else { return }
        
        let delegate = UIApplication.shared.delegate as! AppDelegate
        let context = delegate.persistentContainer.viewContext
        let newTask = Task(context: context)
        newTask.taskName = newItemTextField.text
        
        delegate.saveContext()
        
        newItemTextField.text = ""
        view.endEditing(true)
    }
}

extension InputController: UITextFieldDelegate {
    override func resignFirstResponder() -> Bool {
        return true
    }
}
