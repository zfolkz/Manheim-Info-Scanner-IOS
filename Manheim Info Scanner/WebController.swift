//
//  WebController.swift
//  Manheim Info Scanner
//
//  Created by zFOLKz on 1/21/2560 BE.
//  Copyright © 2560 Manheim. All rights reserved.
//


import UIKit
class WebController: UIViewController {
    
    var titleWeb: String?
    
    @IBOutlet weak var ww: UIWebView!
    @IBAction func backBtnClick(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        title = titleWeb
        
        
        if (titleWeb=="Website"){
             ww.loadRequest(URLRequest(url: URL(string: "https://www.manheimthailand.com")!))
        }else{
             ww.loadRequest(URLRequest(url: URL(string: "https://www.manheimthailand.com/en/site/calendar")!))
        }
       
    }
    
    
}
