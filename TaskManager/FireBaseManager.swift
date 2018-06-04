////
////  File.swift
////  AnyCubed Partner
////
////  Created by Nour  on 1/27/18.
////  Copyright © 2018 NourAraar. All rights reserved.
////
//
//import UIKit
//import SwiftyJSON
//import Firebase
//import GoogleMaps
//
//class FireBaseManager: NSObject{
//    
//    static let shared: FireBaseManager = FireBaseManager()
//    var ref: DatabaseReference!
//     let  partnersRoot = "partners_on_duty"
//    let storesRoot = "stores"
//    let orderRoot = "ongoing_orders"
//    private override init() {
//        super.init()
//        
//         ref = Database.database().reference()
//    }
//    
//    
//    func initialConfig(){
//       
//    }
//    
//    func setOrder(orderId:String,customerId:String){
//        self.ref.child("\(orderRoot)/\(orderId)").setValue(["customer_id":customerId,
//                                                            "confirm_partner":false
//            ])
//    }
//}

