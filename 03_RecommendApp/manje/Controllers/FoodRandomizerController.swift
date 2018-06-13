//
//  FoodRandomizerController.swift
//  manje
//
//  Created by Jessica Joseph on 6/13/18.
//  Copyright © 2018 TFH. All rights reserved.
//

import UIKit

class FoodRandomizerController: UIViewController {

    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var anotherOneButton: UIButton!
    
    let foodItems = ["apple", "cupcake", "icecream", "pineapple", "pizza", "sandwich", "taco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        anotherOneButton.layer.cornerRadius = anotherOneButton.layer.frame.height / 2
        setFoodItem()
    }
    
    func setFoodItem() {
        foodImageView.image = UIImage(named: foodItems[Int(arc4random_uniform(UInt32(foodItems.count)))])
    }
    
    @IBAction func anotherOnePressed(_ sender: Any) {
        setFoodItem()
    }
}
