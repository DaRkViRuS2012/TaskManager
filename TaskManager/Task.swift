//
//  Task.swift
//  TaskManager
//
//  Created by Nour  on 6/3/18.
//  Copyright © 2018 NourAraar. All rights reserved.
//

import Foundation


struct Task {
    
    var ID:Int64
    var title:String
    var date:Date
    
    mutating func save(){
      self.ID = DatabaseManagement.shared.addTask(task: self)
    }
    
    var laps:[Lap]{
        return DatabaseManagement.shared.queryTaskLaps(taskId: self.ID)
    }
    
    var totalseconds:Int {
        var res:Int = 0
        for lap in self.laps{
            res += lap.seconds
        }
        return res
    }
    
    
    static func all() -> [Task]{
        return DatabaseManagement.shared.queryAllTasks()
    }
    
     func delete(){
        for lap in laps{
            lap.delete()
        }
        
        DatabaseManagement.shared.deleteTask(Id: self.ID)
        
        
    }
}


struct Lap{

    var ID:Int64?
    var taskID:Int64?
    var seconds:Int = 0
    var date:Date?
    
    var task:Task? {
        return DatabaseManagement.shared.queryTaskById(id: self.taskID!)
    }
    
    
    mutating func save(){
        self.ID = DatabaseManagement.shared.addLap(lap: self)
    }
    
    
     func delete(){
        _ = DatabaseManagement.shared.deleteLap(Id: self.ID!)
        
        
    }
}
