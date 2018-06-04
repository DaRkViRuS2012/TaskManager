//
//  LabsViewController.swift
//  TaskManager
//
//  Created by Nour  on 6/3/18.
//  Copyright © 2018 NourAraar. All rights reserved.
//

import UIKit

class LabsViewController: AbstractController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newButton: UIButton!
    @IBOutlet weak var totalLabel: UILabel!
    
    
    var task:Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.showNavBackButton = true
        self.setNavBarTitle(title: (task?.title)!)
        self.tableView.tableFooterView = UIView()
        self.newButton.layer.cornerRadius = 23
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
        self.totalLabel.text = "Total: \(DateHelper.timeString(time:TimeInterval( (self.task?.totalseconds)!)))"
    }

    @IBAction func new(_ sender: UIButton) {
        
        let vc = UIStoryboard.mainStoryboard.instantiateViewController(withIdentifier: "TimerViewController") as! TimerViewController
        vc.task = self.task
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension LabsViewController:UITabBarDelegate,UITableViewDataSource{
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (task?.laps.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if  let lap = task?.laps[indexPath.row]{
        if let date = lap.date{
            cell.textLabel?.text = DateHelper.getStringFromDate(date)
        }
            cell.detailTextLabel?.text = "\(DateHelper.timeString(time: TimeInterval(lap.seconds)))"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let lap = task?.laps[indexPath.row]
            let alert = UIAlertController(title: "Delete!", message: "you are about to delete this lap.", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { (action) in
                lap?.delete()
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.totalLabel.text = "Total: \(DateHelper.timeString(time:TimeInterval( (self.task?.totalseconds)!)))"
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}

