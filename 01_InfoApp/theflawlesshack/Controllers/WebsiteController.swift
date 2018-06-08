//
//  WebsiteController.swift
//  theflawlesshack
//
//  Created by Jessica Joseph on 6/7/18.
//  Copyright © 2018 TFH. All rights reserved.
//

import UIKit
import WebKit

class WebsiteController: UIViewController, WKUIDelegate {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let url = URL(string: "http://www.theflawlesshack.com")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
}
