//
//  GalleryController.swift
//  photon
//
//  Created by Jessica Joseph on 6/13/18.
//  Copyright © 2018 TFH. All rights reserved.
//

import UIKit

class GalleryController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getImage(imageName: "jessica.png")
    }
    
    func getImage(imageName: String) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        if fileManager.fileExists(atPath: imagePath) {
            imageView.image = UIImage(contentsOfFile: imagePath)
        } else {
            print("Oh no! No image found 😕")
        }
    }
}
