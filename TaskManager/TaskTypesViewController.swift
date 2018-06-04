//
//  TaskTypesViewController.swift
//  TaskManager
//
//  Created by Nour  on 6/2/18.
//  Copyright © 2018 NourAraar. All rights reserved.
//

import UIKit

class TaskTypesViewController: AbstractController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func customizeView() {
        self.showNavBackButton = true
        self.setNavBarTitle(title: "Select Task")
        self.tableView.tableFooterView = UIView()
        self.newButton.layer.cornerRadius = 23
    }


}


extension TaskTypesViewController:UITableViewDelegate,UITableViewDataSource{
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = "test"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
