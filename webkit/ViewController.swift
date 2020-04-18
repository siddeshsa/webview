//
//  ViewController.swift
//  webkit
//
//  Created by mac on 18/04/20.
//  Copyright © 2020 mac. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate{

    var webView:WKWebView!
    
    let featuredURL = "https://www.youtube.com/"
    let tutorialsURL = "https://www.appbrewery.co/p/ios-course-resources"
    let coursesURL = "https://www.facebook.com/"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let preferences =  WKPreferences()
        preferences.javaScriptEnabled = true
        
        let configuration = WKWebViewConfiguration()
        configuration.preferences = preferences
        
        // create an instance of web view
        
        webView = WKWebView(frame: view.bounds, configuration: configuration)
        webView.navigationDelegate = self
        view.addSubview(webView)
        webViewLoadURL(urlString: featuredURL)
    }
    
    func  webViewLoadURL(urlString: String)
    {
        if let url = NSURL(string: urlString){
            let urlRequest = NSURLRequest(url: url as URL)
            
            webView.load(urlRequest as URLRequest)
        }
    }

    func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func menuChanged(_ sender: UISegmentedControl) {
        let selectedIndex = sender.selectedSegmentIndex
        
        switch selectedIndex {
        case 0:
            webViewLoadURL(urlString: featuredURL)
        case 1:
            webViewLoadURL(urlString: tutorialsURL)
        case 2:
            webViewLoadURL(urlString: coursesURL)
        default:
            webViewLoadURL(urlString: featuredURL)
        }
    }
    
    

}

