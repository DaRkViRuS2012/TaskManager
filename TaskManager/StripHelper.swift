////
////  StripHelper.swift
////  AnyCubed
////
////  Created by Nour  on 12/31/17.
////  Copyright © 2017 NourAraar. All rights reserved.
////
//
//import Foundation
//import Stripe
//
//class StripHelper:STPAPIClient, STPAddCardViewControllerDelegate{
//
//    public static let shared = StripHelper()
//    
//    public var publishKey = "pk_test_YFj5Uui6dPEYYDl79GXOvIfv"
//    
//    override init(configuration: STPPaymentConfiguration) {
//        super.init(configuration: configuration)
//        setPublishKey()
//        
//    }
//   
//    func setPublishKey(){
//         STPPaymentConfiguration.shared().publishableKey = publishKey
//        print(publishKey)
//    }
//    
//
//    override func createToken(withCard card: STPCardParams, completion: STPTokenCompletionBlock? = nil) {
//            guard let completion = completion else { return }
//        
//        
//        
//            STPAPIClient.shared().createToken(withCard: card) { (token: STPToken?, Carderror: Error?) in
//                guard let token = token, Carderror == nil else {
//                    // Present error to user...
//                    completion(nil, Carderror)
//                    return
//                }
//                print(token)
//                print("\(token)")
//                ApiManager.shared.addPaymentMethod(card_token: "\(token)", completionBlock: { (isSuccess, error) in
//                    if isSuccess{
//                        //ActionShowDoneMSG.execute()
//                        completion(token, nil)
//                    }
//                    if error != nil{
//                        print(error)
//                        completion(nil, Carderror)
//                    }
//                })
//        
//            }
//        }
//    
//    //// open add card view
//    
//    func addCardViewControllerDidCancel(_ addCardViewController: STPAddCardViewController) {
//
//    }
//
//    func addCardViewController(_ addCardViewController: STPAddCardViewController, didCreateToken token: STPToken, completion: @escaping STPErrorBlock) {
//
//    }
//    
//    func showAddCardViewController(){
//        // Setup add card view controller
//        let addCardViewController = STPAddCardViewController()
//        addCardViewController.delegate = self
//        
//        // Present add card view controller
//        let navigationController = UINavigationController(rootViewController: addCardViewController)
//        UIApplication.visibleViewController()?.present(navigationController, animated: true, completion: nil)
//    }
//
//
//
//
//func test(){
////
////    // Generate a mock card model using the given card params
////    var cardJSON: [String: Any] = [:]
////    cardJSON["id"] = "\(card.hashValue)"
////    cardJSON["exp_month"] = "\(card.expMonth)"
////    cardJSON["exp_year"] = "\(card.expYear)"
////    cardJSON["name"] = card.name
////    //        cardJSON["address_line1"] = card.address.line1
////    //        cardJSON["address_line2"] = card.address.line2
////    //        cardJSON["address_state"] = card.address.state
////    //        cardJSON["address_zip"] = card.address.postalCode
////    //        cardJSON["address_country"] = card.address.country
////    cardJSON["cvc"] = card.cvc
////    cardJSON["last4"] = card.last4()
////    if let number = card.number {
////        let brand = STPCardValidator.brand(forNumber: number)
////        cardJSON["brand"] = STPCard.string(from: brand)
////    }
////    cardJSON["fingerprint"] = "\(card.hashValue)"
////    //        cardJSON["country"] = "US"
////    let tokenJSON: [String: Any] = [
////        "id": "\(card.hashValue)",
////        "object": "token",
////        "livemode": false,
////        "created": NSDate().timeIntervalSince1970,
////        "used": false,
////        "card": cardJSON,
////        ]
////    let token = STPToken.decodedObject(fromAPIResponse: tokenJSON)
////    DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
////        completion(token, nil)
////    }
////
////
////
//}
//
//}
//
//
