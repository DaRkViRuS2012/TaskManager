//
//  FireBaseHelper.swift
//  AnyCubed
//
//  Created by Nour  on 1/26/18.
//  Copyright © 2018 NourAraar. All rights reserved.
//

import Foundation
//import Firebase
//
//
//extension DatabaseReference {
//    func fetch<T: Codable, S>(_ type: T.Type, forChild child: FirebaseChild<S>, completionHandler: @escaping (T?) -> Void) {
//        self.child(child.path).observeSingleEvent(of: .value) { snapshot in
//            var result: T? = nil
//            
//            if let data = snapshot.value as? S,
//                let json = try? JSONEncoder().encode(data) {
//                result = try? JSONDecoder().decode(type, from: json)
//            }
//            completionHandler(result)
//        }
//    }
//}
//
//struct FirebaseChild<S: Codable> {
//    let path: String
//}

