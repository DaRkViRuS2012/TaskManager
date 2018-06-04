//
//  HomeViewController.swift
//  TaskManager
//
//  Created by Nour  on 6/2/18.
//  Copyright © 2018 NourAraar. All rights reserved.
//

import UIKit

class HomeViewController: AbstractController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavBarTitle(title: "Tasks")
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    override func customizeView() {
        self.newButton.layer.cornerRadius = 23
        self.tableView.tableFooterView = UIView()
    }



}



extension HomeViewController:UITableViewDataSource,UITableViewDelegate{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return Task.all().count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = Task.all()[indexPath.row]
        cell.textLabel?.text = task.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let task = Task.all()[indexPath.row]
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier:
            "LabsViewController") as! LabsViewController
        vc.task = task
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let task = Task.all()[indexPath.row]
            let alert = UIAlertController(title: "Delete", message: "you are about to delete \(task.title)", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action) in
                task.delete()
                tableView.deleteRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
}
