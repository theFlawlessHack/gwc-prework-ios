//  Created by Jessica Joseph on 5/31/18.
//  Copyright © 2018 TFH. All rights reserved.

import UIKit

class ThoughtsController: UIViewController {

    @IBOutlet weak var thoughtLabel: UILabel!
    @IBOutlet weak var thoughtButton: UIButton!
    
    let thoughts = ["I could go for some pizza.", "YASSSS", "C++ is BAE!", "Grind grind grind", "iS tHis hOw iT's DoNe?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        thoughtButton.layer.cornerRadius = thoughtButton.layer.frame.size.height / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func generateThought(_ sender: Any) {
        thoughtLabel.isHidden = false
        
        thoughtLabel.text = thoughts[Int(arc4random_uniform(UInt32(thoughts.count)))]
    }
    
}

