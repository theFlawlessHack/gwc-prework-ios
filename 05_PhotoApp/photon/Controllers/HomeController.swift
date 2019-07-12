//  Created by Jessica Joseph on 6/13/18.
//  Copyright © 2018 TFH. All rights reserved.

import UIKit

class HomeController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    var imagePickerController: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func savePhoto(imageName: String) {
        guard let image = imageView.image else { return }
        
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        
        let imageData = image.pngData()
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil)
    }

    @IBAction func savePhoto(_ sender: Any) {
        savePhoto(imageName: "jessica.png")
    }
    
    @IBAction func takePhoto(_ sender: Any) {
        imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        imagePickerController.sourceType = .camera
        present(imagePickerController, animated: true, completion: nil)
    }
}

extension HomeController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagePickerController.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
}
