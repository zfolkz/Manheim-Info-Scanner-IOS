//
//  CallService.swift
//  Manheim Info Scanner
//
//  Created by zFOLKz on 1/14/2560 BE.
//  Copyright © 2560 Manheim. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Util {
    static var URL_API = ""
    static var DateData: JSON = JSON.null
    static var CarDetailData: JSON = JSON.null
    static var TitleBookData: JSON = JSON.null
    static var SimucastData: JSON = JSON.null
    static var OCPBData: JSON = JSON.null
    static var PhotoData: JSON = JSON.null
}
var delegate: CallServiceDelegate?

class CallService{
    
    
    
    static func getAuctionByDate(auctionDate: String){
        
        
        Util.DateData = JSON.null
        
        delegate?.reload()
        
        let url  = Util.URL_API + "ServiceAuctionByDate.svc/GetAuctionByDate/"+auctionDate
        
        Alamofire.request(url).responseJSON { response in
           
            
            if response.result.value != nil {
                
                
                //print("JSON: \(jsonData)")
                
                let swiftyJsonVar = JSON(response.result.value!)
                
                Util.DateData = swiftyJsonVar
                
                delegate?.success()
        
            }else{
                delegate?.fail()
            }
        }
    }
    
    static func getCarDetailByLot(auctionDate: String , lotNumber: String) {
        
        Util.CarDetailData = JSON.null
        
        delegate?.reload()
        
        let url  = Util.URL_API + "ServiceVehicleDetailsByLot.svc/GetVehicleDetailsByLot/"+auctionDate+"/"+lotNumber
        
        Alamofire.request(url).responseJSON { response in
            
            
            if response.result.value != nil {
                
                
                //print("JSON: \(jsonData)")
                
                let swiftyJsonVar = JSON(response.result.value!)
                
                Util.CarDetailData = swiftyJsonVar
                
                
                 print("JSON: \(Util.CarDetailData)")
                delegate?.success()
            }else{
                delegate?.fail()
            }
        }
        
    }
    static func getCarDetailByReg(auctionDate: String , registration: String) {
        
        Util.CarDetailData = JSON.null
        
        delegate?.reload()
        
        let url  = Util.URL_API + "ServiceVehicleDetailsByReg.svc/GetVehicleDetailsByReg/"+auctionDate+"/"+registration
        
        Alamofire.request(url).responseJSON { response in
            
            
            if response.result.value != nil {
                
                
                //print("JSON: \(jsonData)")
                
                let swiftyJsonVar = JSON(response.result.value!)
                
                Util.CarDetailData = swiftyJsonVar
                
                
                print("JSON: \(Util.CarDetailData)")
                
                delegate?.success()
                
            }else{
                delegate?.fail()
            }
        }
        
    }
    static func getCarDetailByVehicle(vehicle: String) {
        
        Util.CarDetailData = JSON.null
        
        delegate?.reload()
        
        let url  = Util.URL_API + "ServiceVehicleDetailsByVehicle.svc/GetVehicleDetailsByVehicle/"+vehicle
        Alamofire.request(url).responseJSON { response in
            
            
            if response.result.value != nil {
                
                
                //print("JSON: \(jsonData)")
                
                let swiftyJsonVar = JSON(response.result.value!)
                
                Util.CarDetailData = swiftyJsonVar
                
                
                print("JSON: \(Util.CarDetailData)")
                
                delegate?.success()
            }else{
                delegate?.fail()
            }
        }
        
    }
    static func getOCPB(systemLanguage: String , vehicle: String) {
        
        Util.OCPBData = JSON.null
        
        delegate?.reload()
        
        let url  = Util.URL_API + "ServiceOCPB.svc/GetOCPB/"+systemLanguage+"/"+vehicle
        Alamofire.request(url).responseJSON { response in
            
            
            if response.result.value != nil {
                
                
                //print("JSON: \(jsonData)")
                
                let swiftyJsonVar = JSON(response.result.value!)
                
                Util.OCPBData = swiftyJsonVar
                
                
                print("JSON: \(Util.OCPBData)")
                
                if (swiftyJsonVar["GetOCPBResult"][0] != JSON.null){
                    delegate?.success()
                }
                
            }else{
                delegate?.fail()
            }
        }
        
    }
    
    static func getPhoto(vehicle: String) {
        
        Util.PhotoData = JSON.null
        
        delegate?.reload()
        
        let url  = Util.URL_API + "ServiceDocumentItems.svc/GetDocumentItems/"+vehicle
        Alamofire.request(url).responseJSON { response in
            
            
            if response.result.value != nil {
                
                
                //print("JSON: \(jsonData)")
                
                let swiftyJsonVar = JSON(response.result.value!)
                
                Util.PhotoData = swiftyJsonVar
                
                
                print("JSON: \(Util.PhotoData)")
                
                if (swiftyJsonVar["GetDocumentItemsResult"][0] != JSON.null){
                    delegate?.success()
                }
                
            }else{
                delegate?.fail()
            }
        }
        
    }
    
    static func getDocumentById(vehicle: String , documentTypeID: String) {
        
        Util.SimucastData = JSON.null
        
        Util.TitleBookData = JSON.null
        
        delegate?.reload()
        
        let url  = Util.URL_API + "ServiceDocuments.svc/GetDocumentById/"+vehicle+"/"+documentTypeID
        Alamofire.request(url).responseJSON { response in
            
            
            if response.result.value != nil {
                
                
                
                let swiftyJsonVar = JSON(response.result.value!)
                
                
                print("JSON: \(swiftyJsonVar)")
                
                if (documentTypeID == "4"){
                    
                    Util.SimucastData = swiftyJsonVar
                    
                    if (swiftyJsonVar["GetDocumentByIdResult"][0] != JSON.null){
                         delegate?.success()
                    }
                   
                    
                }else if (documentTypeID == "6"){
                    
                    Util.TitleBookData = swiftyJsonVar
                    
                    if (swiftyJsonVar["GetDocumentByIdResult"][0] != JSON.null){
                        delegate?.success()
                    }
                }
                
               
            }else{
                delegate?.fail()
            }
        }
        
    }

}

protocol CallServiceDelegate {
    func success()
    func fail()
    func reload()
}

