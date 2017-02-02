//
//  OCPBController.swift
//  Manheim Info Scanner
//
//  Created by zFOLKz on 1/23/2560 BE.
//  Copyright © 2560 Manheim. All rights reserved.
//

import UIKit
import SwiftyJSON

class OCPBController: UIViewController , CallServiceDelegate{
    
    @IBOutlet weak var txt: UITextView!
    
    override func viewDidLoad() {
     /*  CallService.getOCPB(systemLanguage: "BU" , vehicle: "000000000001163270")
        
         delegate = self*/
        
        
        delegate = self
        
       
        if (Util.OCPBData["GetOCPBResult"][0] != JSON.null){
            //let string : String = Util.OCPBData["GetOCPBResult"][0]["AuctionCode"].string!
            
            let OCPBData : JSON = Util.OCPBData["GetOCPBResult"][0]
            
            txt.text = StringUtil.auctionCode+OCPBData["AuctionCode"].string!+"\n"+StringUtil.imap+OCPBData["Vehicle"].string!+"\n"+StringUtil.lot+String(describing: OCPBData["Lot"].number!)+"\n"+StringUtil.type+OCPBData["VehicleType"].string!+"\n"+StringUtil.seller+OCPBData["SellerName"].string!+"\n"+StringUtil.location+OCPBData["SellerAddress"].string!+"\n\n"+StringUtil.capacity+String(describing: OCPBData["EngineCapacity"].number!)+" "+OCPBData["EngineCapacityUnit"].string!+"\n"+StringUtil.book_service+OCPBData["BookService"].string!+"\n"+StringUtil.build_year+OCPBData["BuildYear"].string!+"\n"+StringUtil.price+StringUtil.user_price+"\n"+StringUtil.date_first_reg+OCPBData["DateFirstReg"].string!+"\n"+StringUtil.reg+OCPBData["Registration"].string!+"\n"+StringUtil.chasis_number+OCPBData["ChasisNumber"].string!+"\n"+StringUtil.engine_number+OCPBData["EngineNumber"].string!+"\n"+StringUtil.make+OCPBData["Make"].string!+"\n"+StringUtil.engine_manufacturer+OCPBData["EngineManufacturer"].string!+"\n"+StringUtil.colour+OCPBData["Colour"].string!+"\n"+StringUtil.fuel_type+OCPBData["FuelType"].string!+"\n"+StringUtil.owner+OCPBData["OwnerNumber"].string!+"\n"+StringUtil.obligations+OCPBData["CatalogueDesc"].string!+"\n"+StringUtil.accident_car+OCPBData["AccidentCar"].string!+"\n"+StringUtil.flood_car+OCPBData["FloodCar"].string!+"\n"+StringUtil.distance+String(describing: OCPBData["Km"].number!)+StringUtil.not_garuntee+"\n"+StringUtil.category+StringUtil.already_use+"\n"+StringUtil.howto+StringUtil.suggest+StringUtil.warn+"\n\n  "+StringUtil.notice



        }
    }
    
    func success() {
        if (Util.OCPBData["GetOCPBResult"][0] != JSON.null){
            //let string : String = Util.OCPBData["GetOCPBResult"][0]["AuctionCode"].string!
            //txt.text = string
            
            let OCPBData : JSON = Util.OCPBData["GetOCPBResult"][0]
            
            txt.text = StringUtil.auctionCode+OCPBData["AuctionCode"].string!+"\n"+StringUtil.imap+OCPBData["Vehicle"].string!+"\n"+StringUtil.lot+String(describing: OCPBData["Lot"].number!)+"\n"+StringUtil.type+OCPBData["VehicleType"].string!+"\n"+StringUtil.seller+OCPBData["SellerName"].string!+"\n"+StringUtil.location+OCPBData["SellerAddress"].string!+"\n\n"+StringUtil.capacity+String(describing: OCPBData["EngineCapacity"].number!)+" "+OCPBData["EngineCapacityUnit"].string!+"\n"+StringUtil.book_service+OCPBData["BookService"].string!+"\n"+StringUtil.build_year+OCPBData["BuildYear"].string!+"\n"+StringUtil.price+StringUtil.user_price+"\n"+StringUtil.date_first_reg+OCPBData["DateFirstReg"].string!+"\n"+StringUtil.reg+OCPBData["Registration"].string!+"\n"+StringUtil.chasis_number+OCPBData["ChasisNumber"].string!+"\n"+StringUtil.engine_number+OCPBData["EngineNumber"].string!+"\n"+StringUtil.make+OCPBData["Make"].string!+"\n"+StringUtil.engine_manufacturer+OCPBData["EngineManufacturer"].string!+"\n"+StringUtil.colour+OCPBData["Colour"].string!+"\n"+StringUtil.fuel_type+OCPBData["FuelType"].string!+"\n"+StringUtil.owner+OCPBData["OwnerNumber"].string!+"\n"+StringUtil.obligations+OCPBData["CatalogueDesc"].string!+"\n"+StringUtil.accident_car+OCPBData["AccidentCar"].string!+"\n"+StringUtil.flood_car+OCPBData["FloodCar"].string!+"\n"+StringUtil.distance+String(describing: OCPBData["Km"].number!)+StringUtil.not_garuntee+"\n"+StringUtil.category+StringUtil.already_use+"\n"+StringUtil.howto+StringUtil.suggest+StringUtil.warn+"\n\n  "+StringUtil.notice
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
