//
//  WelcomeViewController.swift
//  Wardah
//
//  Created by Nour  on 11/12/17.
//  Copyright © 2017 AlphaApps. All rights reserved.
//

import UIKit

class WelcomeViewController: AbstractController {


    

    @IBOutlet weak var welcomView: UIView!

    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func customizeView() {
        // set fonts 
   
        startButton.titleLabel?.font = AppFonts.big
        
        
        // set Colors
     //   startButton.backgroundColor = AppColors.primary
        startButton.setTitleColor(.white, for: .normal)
        
        
       
        
        // set title
        

        startButton.setTitle("WELCOME_START_BUTTON_TITLE".localized, for: .normal)
        
        startButton.layer.cornerRadius = startButton.frame.height / 2
    }
    
    override func buildUp() {
       
        welcomView.animateIn(mode: .animateInFromBottom, delay: 0.3)
        startButton.animateIn(mode: .animateInFromBottom, delay: 0.4)
    }
    
    
    
    @IBAction func facebookAction(_ sender: UIButton) {
        // show activity loader
    }


}
