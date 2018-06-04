//
//  NewTaskViewController.swift
//  TaskManager
//
//  Created by Nour  on 6/3/18.
//  Copyright © 2018 NourAraar. All rights reserved.
//

import UIKit

class NewTaskViewController: AbstractController {

    @IBOutlet weak var titleTextField: XUITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.setNavBarTitle(title: "New Task")
       self.showNavBackButton = true
        
    }

    @IBAction func save(_ sender: UIButton) {
        if let title = titleTextField.text,!title.isEmpty{
            var newTask = Task(ID: -1, title: title, date: Date())
            newTask.save()
            self.showMessage(message: "Done", type: .success)
            self.popOrDismissViewControllerAnimated(animated: true)
        }else{
            
            self.showMessage(message: "Please Enter the Title od your Task", type: .error)
        }
        
    }
    
   

}
