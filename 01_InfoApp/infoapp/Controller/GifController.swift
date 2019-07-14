//  Created by Jessica Joseph on 6/5/19.
//  Copyright © 2019 B0RN BKLYN. All rights reserved.

// MARK: Import Frameworks
// UIKit (User Interface Kit), the Apple provided framework for UI elements
// WebKit, the Apple provided framework for integrating Web view within your screen
import WebKit
import UIKit

// MARK: Gif Controller Class
// This Controller class handles the displaying of a gif within a WebView through a button click
class GifController: UIViewController {
    
    // MARK: Interface Builder Outlets
    // WKWebView is added to the storyboard above all elements and set to be hidden w/in the Utilities pane - Attributes Inspector
    // This connection is tied to the WkWebView added to the associated storyboard
    @IBOutlet weak var webView: WKWebView!
    
    // MARK: Overridden Parent Class Methods
    // viewDidLoad() is called once the view has loaded onto the screen
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // viewWillDisappear(_:) is called right before the view is about to go off screen
    // An example of a trigger switching screens (views)
    override func viewWillDisappear(_ animated: Bool) {
        // reset the webview's appearance to be hidden
        webView.isHidden = true
    }
    
    // MARK: Interface Builder Actions (Methods)
    // openWebsite(_:) opens the website and loads the gif on the view
    @IBAction func openWebsite(_ sender: Any) {
        // using a guard to assure the url is valid and will be accessible for the remainder of this function
        guard let url = URL(string: "https://media.giphy.com/media/Ue0jev5l4BKgM/giphy.gif") else {
            // if the creating of the url constant was not successful (URL instance creation failed),
            // return and get out of the function
            
            // return is synonomous to return Void (Swift can infer Void from just writing return)
            // Void is synonmous to an empty vessel/placeholder
            return
            
        }
        
        // create a url request from the url instance created above
        let request = URLRequest(url: url)
        
        // load the url request into the webView connected on the associated storyboard
        webView.load(request)
        
        // Unhide the webview, revealing the loaded website
        webView.isHidden = false
    }
}
