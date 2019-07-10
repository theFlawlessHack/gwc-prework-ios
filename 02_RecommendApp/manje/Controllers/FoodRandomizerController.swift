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
    
    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        setFoodItem()
    }
    
    func setFoodItem() {
        guard let foodItem = foodItems.randomElement() else { return }
        
        foodImageView.image = UIImage(named: foodItem)
    }
    
    @IBAction func anotherOnePressed(_ sender: Any) {
        setFoodItem()
    }
}
