//
//  FoodRandomizerController.swift
//  manje
//
//  Created by Jessica Joseph on 7/9/19.
//  Copyright © 2019 TFH. All rights reserved.
//

import UIKit

class FoodRandomizerController: UIViewController {

    
    @IBOutlet weak var mainImageView: UIImageView!
    
    let foodItems = ["apple", "cupcake", "icecream", "pineapple", "pizza", "sandwich", "taco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setRandomItem()
    }
    
    func setRandomItem() {
        guard let item = foodItems.randomElement() else { return }
        mainImageView.image = UIImage(named: item)
    }
    
    @IBAction func anotherOne(_ sender: Any) {
        setRandomItem()
    }
}
