//
//  HomeViewController.swift
//  Manheim Info Scanner
//
//  Created by zFOLKz on 1/18/2560 BE.
//  Copyright © 2560 Manheim. All rights reserved.
//

import UIKit




struct HomeData {
    static var tabBarHeight = CGFloat(0)
}
class HomeViewController: UITabBarController {
   
    
    override func viewDidLoad() {
        let screenSize = UIScreen.main.bounds
        self.tabBar.frame = CGRect(x: 0, y: 120, width: screenSize.width, height: 50)
        
        HomeData.tabBarHeight = self.tabBar.frame.size.height
    }
    
   
}
