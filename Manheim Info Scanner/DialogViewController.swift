//
//  DialogViewController.swift
//  Manheim Info Scanner
//
//  Created by Annop Kongsukthai on 1/17/17.
//  Copyright © 2017 Manheim. All rights reserved.
//

import UIKit



class DialogViewController: UIViewController {
    var delegate: DialogDelegate?
    
    
    @IBOutlet weak var current_date: UILabel!
 
    @IBAction func onShadowViewClick(_ sender: Any) {
        self.dismiss(animated: true,  completion: { () -> Void   in
            
        })
    }
    
    override func viewDidLoad() {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateString = formatter.string(from: date)
        
        current_date.text = "Current Date : "+dateString
        
    }
    
    @IBAction func onCancelClick(_ sender: Any) {
        self.dismiss(animated: true,  completion: { () -> Void   in
            
        })
    }
    @IBAction func onSearchClick(_ sender: Any) {
        self.dismiss(animated: true,  completion: { () -> Void   in
            self.delegate?.setData(data: "sss")
        })
        
        
        /*let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let vc : UIViewController = mainStoryboard.instantiateViewController(withIdentifier: "HomeId") as UIViewController
        self.present(vc, animated: true, completion: nil)*/
        
           }
}
protocol DialogDelegate {
    func setData(data: String)
}

