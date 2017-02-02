//
//  CarDetailController.swift
//  Manheim Info Scanner
//
//  Created by zFOLKz on 1/22/2560 BE.
//  Copyright © 2560 Manheim. All rights reserved.
//

import UIKit
import SwiftyJSON

class CarDetailController: UIViewController ,CallServiceDelegate{
   
    @IBOutlet weak var txt: UITextView!
    override func viewDidLoad() {
    
        
        /*CallService.getCarDetailByVehicle(vehicle: "000000000001163270")
        
        let mainPage = self.storyboard?.instantiateViewController(withIdentifier: "main") as! ViewController
        
    
        mainPage.manTitle.title = "Cardetail"
        
        delegate = self*/
        
        delegate = self
        
       
        if (Util.CarDetailData["GetVehicleDetailsByVehicleResult"][0] != JSON.null){
            let string : String = Util.CarDetailData["GetVehicleDetailsByVehicleResult"][0]["Registration"].string!
            print("JSON: \(string)")
            
            
            let CarDetailData : JSON = Util.CarDetailData["GetVehicleDetailsByVehicleResult"][0]
            
            txt.text = CarDetailData["Registration"].string!
        }
        
    }
    
    func success() {
        //
        
        if (Util.CarDetailData["GetVehicleDetailsByVehicleResult"][0] != JSON.null){
            let string : String = Util.CarDetailData["GetVehicleDetailsByVehicleResult"][0]["Registration"].string!
            print("JSON: \(string)")
            
            
            
            
            let CarDetailData : JSON = Util.CarDetailData["GetVehicleDetailsByVehicleResult"][0]
            
            txt.text = CarDetailData["Registration"].string!
            
        }
        
    }
    func fail() {
        //
    }
    func reload() {
        //
        txt.text = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        delegate = self
    }
}
