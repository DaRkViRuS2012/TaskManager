//
//  StartViewController.swift
//  Wardah
//
//  Created by Molham Mahmoud on 4/25/17.
//  Copyright © 2017 BrainSocket. All rights reserved.
//

import UIKit

class StartViewController: AbstractController {

    // MARK: Properties
    
    // MARK: Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // check if user logged in
       
        if DataStore.shared.isLoggedin {
            print(DataStore.shared.me?.token)
             self.performSegue(withIdentifier: "HomeViewSegue", sender: self)
        }else{
             self.performSegue(withIdentifier: "startHomeSegue", sender: self)
        }
        
//        if DataStore.shared.isLoggedin {
//        let vc = AppNavigationDrawerController(rootViewController: AppToolbarController(rootViewController:RootViewController()), leftViewController: LeftViewController(), rightViewController: nil)
//        self.present(vc, animated: true, completion: nil)
//        } else {// user not logged in
//            self.performSegue(withIdentifier: "startLoginSegue", sender: self)
//       }
   }
    
}

