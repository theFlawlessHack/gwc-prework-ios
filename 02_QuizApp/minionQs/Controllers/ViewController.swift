//
//  ViewController.swift
//  minionQs
//
//  Created by Jessica Joseph on 6/10/18.
//  Copyright © 2018 TFH. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func submitAnswer0(_ sender: Any) {
    }
    
    @IBAction func submitAnswer1(_ sender: Any) {
    }
    
    @IBAction func submitAnswer2(_ sender: Any) {
    }
    
    @IBAction func submitAnswer3(_ sender: Any) {
    }
}

