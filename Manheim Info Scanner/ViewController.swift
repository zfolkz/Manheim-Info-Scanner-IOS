//
//  ViewController.swift
//  Manheim Info Scanner
//
//  Created by zFOLKz on 1/14/2560 BE.
//  Copyright © 2560 Manheim. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON
import Material
import KYDrawerController

class ViewController: UIViewController , DialogDelegate{
    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var manTitle: UINavigationItem!
    
    @IBOutlet weak var homeBtn: UIBarButtonItem!
    
    @IBOutlet weak var noDataLb: UILabel!
    
    @IBOutlet weak var homeView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        homeView.isHidden = true
    }
    
    /*func didTapOpenButton(_ sender: UIBarButtonItem) {
        if let drawerController = navigationController?.parent as? KYDrawerController {
            drawerController.setDrawerState(.opened, animated: true)
        }
    }*/
    
    @IBAction func homeBtnClick(_ sender: UIBarButtonItem) {
        if let drawerController = navigationController?.parent as? KYDrawerController {
            drawerController.setDrawerState(.opened, animated: true)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnClick(_ sender: Any) {
        
        
    }
    func setData(data: String) {
        noDataLb.isHidden = true
        homeView.isHidden = false
        print(data)
        
        
        CallService.getAuctionByDate(auctionDate: "2015-04-22")
        CallService.getCarDetailByLot(auctionDate: "2015-04-22",lotNumber: "1004")
        CallService.getCarDetailByReg(auctionDate: "2015-04-22",registration: "ฆฉ-8230")
        CallService.getCarDetailByVehicle(vehicle: "000000000001163270")
        CallService.getOCPB(systemLanguage: "BU" , vehicle: "000000000001163270")
        CallService.getPhoto(vehicle: "000000000001163270")
        CallService.getDocumentById(vehicle: "000000000001163270", documentTypeID: "4")
        CallService.getDocumentById(vehicle: "000000000001163270", documentTypeID: "6")
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier=="homeSegue") {
            let dia = segue.destination as! DialogViewController
            dia.delegate = self
        }
    }
    
}
