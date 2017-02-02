//
//  SimucastController.swift
//  Manheim Info Scanner
//
//  Created by zFOLKz on 1/23/2560 BE.
//  Copyright © 2560 Manheim. All rights reserved.
//

import UIKit
import SwiftyJSON

class SimucastController: UIViewController , CallServiceDelegate{
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {

        
        
       /*  CallService.getDocumentById(vehicle: "000000000001163270", documentTypeID: "4")
        
        delegate = self*/
        
        delegate = self
        
        if (Util.SimucastData["GetDocumentByIdResult"][0] != JSON.null){
            
            let string : String = Util.SimucastData["GetDocumentByIdResult"][0]["DocumentFile"].string!
            
            
            
            let dataDecoded:Data = Data(base64Encoded: string, options: NSData.Base64DecodingOptions(rawValue: 0))!
            
            let decodedimage:UIImage = UIImage(data: dataDecoded)!
            
            
            print(decodedimage)
            
            img.image = decodedimage
            
        }
        
    }
    func success() {
        
        if (Util.SimucastData["GetDocumentByIdResult"][0] != JSON.null){
            
            let string : String = Util.SimucastData["GetDocumentByIdResult"][0]["DocumentFile"].string!
            
            
            
            let dataDecoded:Data = Data(base64Encoded: string, options: NSData.Base64DecodingOptions(rawValue: 0))!
            
            let decodedimage:UIImage = UIImage(data: dataDecoded)!
            
            
            print(decodedimage)
            
            img.image = decodedimage
            
        }
    
    }
    func fail() {
        //
    }
    func reload() {
       //
    }
 
}