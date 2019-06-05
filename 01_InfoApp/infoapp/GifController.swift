//
//  GifController.swift
//  infoapp
//
//  Created by Jessica Joseph on 6/5/19.
//  Copyright © 2019 B0RN BKLYN. All rights reserved.
//

import WebKit
import UIKit

class GifController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        // reset the webview's appearance
        webView.isHidden = true
    }
    
    
    @IBAction func openWebsite(_ sender: Any) {
        guard let url = URL(string: "https://media.giphy.com/media/Ue0jev5l4BKgM/giphy.gif") else { return }
        
            let request = URLRequest(url: url)
            webView.load(request)
        webView.isHidden = false
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
