//
//  DrawerViewController.swift
//  Manheim Info Scanner
//
//  Created by Annop Kongsukthai on 1/16/17.
//  Copyright © 2017 Manheim. All rights reserved.
//

import UIKit
import KYDrawerController

class DrawerViewController: UITableViewController {
    
    var items: [String] = ["Website", "Catalogue", "Wishlist","Version"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func didTapCloseButton(_ sender: UIButton) {
        if let drawerController = parent as? KYDrawerController {
            drawerController.setDrawerState(.closed, animated: true)
        }
    }
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print (items[indexPath.row])
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav =  segue.destination as! UINavigationController
        
        let wc = nav.topViewController as! WebController
        

        if (segue.identifier == "web"){
            wc.titleWeb = items[0]
        }else if (segue.identifier == "cata"){
            wc.titleWeb = items[1]
        }
    }

}
