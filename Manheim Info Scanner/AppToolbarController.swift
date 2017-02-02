//
//  AppToolbarController.swift
//  Manheim Info Scanner
//
//  Created by zFOLKz on 1/15/2560 BE.
//  Copyright © 2560 Manheim. All rights reserved.
//

import UIKit
import Material

class AppToolbarController: ToolbarController {
    fileprivate var menuButton: IconButton!
    fileprivate var starButton: IconButton!
    fileprivate var searchButton: IconButton!
    
    open override func prepare() {
        super.prepare()
        prepareMenuButton()
        prepareStarButton()
        prepareSearchButton()
        prepareStatusBar()
        prepareToolbar()
    }
}

extension AppToolbarController {
    fileprivate func prepareMenuButton() {
        menuButton = IconButton(image: Icon.cm.menu, tintColor: .white)
        menuButton.pulseColor = .white
    }
    
    fileprivate func prepareStarButton() {
        starButton = IconButton(image: Icon.cm.star, tintColor: .white)
        starButton.pulseColor = .white
    }
    
    fileprivate func prepareSearchButton() {
        searchButton = IconButton(image: Icon.cm.search, tintColor: .white)
        searchButton.pulseColor = .white
    }
    
    fileprivate func prepareStatusBar() {
        statusBarStyle = .lightContent
        statusBar.backgroundColor = Color.blue.darken3
    }
    
    fileprivate func prepareToolbar() {
        toolbar.backgroundColor = Color.blue.darken2
        toolbar.leftViews = [menuButton]
        toolbar.rightViews = [starButton, searchButton]
    }
}
