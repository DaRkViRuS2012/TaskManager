






import Foundation
import SQLite

class DatabaseManagement {
    
    
    static let shared:DatabaseManagement = DatabaseManagement()
    
    
    private let db: Connection?
    

    private init() {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        
        do {
            db = try Connection("\(path)/db.sqlite3")
            createTasksTable()
            createLapTable()
           
            
        } catch {
            db = nil
            print ("Unable to open database")
        }
    }

 
    /////////////// Tasks ///////////
    
    
    private let tblTasks = Table("Tasks")
    private let taskID = Expression<Int64>("id")
    private let taskUserID = Expression<Int64>("UserId")
    private let taskTitle = Expression<String>("title")
    private let taskCreatedDate = Expression<Date>("CreatedDate")
    
    
    func createTasksTable() {
        do {
            try db!.run(tblTasks.create(ifNotExists: false) { table in
                table.column(taskID, primaryKey: true)
               // table.column(taskUserID, references: tblUser,UserId)
                table.column(taskTitle ,unique: true)
                table.column(taskCreatedDate)
            })
            print("create Header table successfully")
        } catch {
            print("Unable to create Header table")
        }
    }
    
    
    func addTask(task:Task) -> Int64 {
        do {
            let insert = tblTasks.insert(taskTitle <- task.title,taskCreatedDate <- task.date)
            if let id = try db?.run(insert){
                print("Insert to tblHeader successfully userid \(id)")
                return id
            }
        return -1
        } catch {
            print("Cannot insert to tblHeader ")
            print(error)
            return -1
        }
    }
    

    
    func queryAllTasks() -> [Task] {
        var tasks = [Task]()
        
        do {
            for task in try db!.prepare(self.tblTasks) {
            
               let newTask = Task(ID: task[taskID], title: task[taskTitle], date: task[taskCreatedDate])
                tasks.append(newTask)
            }
        } catch {
            print("Cannot get list of product")
        }
        for task in tasks {
            print("each product = \(task)")
        }
        return tasks
    }

    
   

    
    
    func queryTaskById(id:Int64) -> Task? {
        do{
            let tbl  = tblTasks.filter(taskID == id)
            if let task  = try db?.pluck(tbl){
            let newTask = Task(ID: task[taskID],title: task[taskTitle],date:task[taskCreatedDate])
                return newTask
            }
            return nil
        }catch{
            return nil
        }
        
    }
    
    
    
    func updateTask(id:Int64, task: Task) -> Bool {
        let headertbl = tblTasks.filter(taskID == id)
        do {
            let update = headertbl.update([
                    taskTitle <- task.title
                ])
            if try db!.run(update) > 0 {
                print("Update item successfully")
                return true
            }
        } catch {
            print("Update failed: \(error)")
        }
        
        return false
    }
    
    
    func deleteTask(Id: Int64) -> Bool {
        do {
            let tbl = tblTasks.filter(taskID == Id)
            try db!.run(tbl.delete())
            print("delete sucessfully")
            return true
        } catch {
            
            print("Delete failed")
        }
        return false
    }
    
    
    ///////////////// End Of Tasks //////////
    
    ///////////////// USER //////////////////
    
    //Mark: Users
    
//    private let tblUser = Table("User")
//    private let UserId = Expression<Int64>("id")
//    private let UserFirstName = Expression<String>("FirstName")
//    private let UserLastName = Expression<String>("LastName")
//    private let UserEmail = Expression<String>("Email")
//    private let UserName = Expression<String>("UserName")
//    private let UserImage = Expression<String?>("Image")
//    private let UserPWD = Expression<String>("Password")
//    private let UserisActive = Expression<Bool>("isActive")
//    private let UserVendorCode = Expression<String?>("VendorCode")
//
//
//
//
//    func createTableUser() {
//        do {
//            try db!.run(tblUser.create(ifNotExists: false) { table in
//                table.column(UserId, primaryKey: true)
//                table.column(UserFirstName)
//                table.column(UserLastName)
//                table.column(UserName,unique: true)
//                table.column(UserImage)
//                table.column(UserPWD)
//                table.column(UserisActive)
//                table.column(UserVendorCode)
//                table.column(UserEmail)
//            })
//            print("create User table successfully")
//        } catch {
//            print("Unable to create User table")
//        }
//    }
//
//    func addUser(user:AppUser) -> Int64? {
//        do {
//            let insert = tblUser.insert(UserFirstName <- user.UserFirstName,UserLastName <- user.UserLastName,UserEmail <- user.UserEmail,UserName <- user.UserName , UserImage <- user.UserImage
//                ,UserPWD <- user.UserPWD , UserisActive <- user.UserisActive )
//            let id = try db!.run(insert)
//            print("Insert to tblUser successfully")
//            return id
//        } catch {
//            print("Cannot insert to tblUser ")
//            print(error)
//            return nil
//        }
//    }
//
//    func queryUserById(id:Int64) -> AppUser? {
//        do{
//            let userid  = try tblUser.filter(UserId == id)
//            let user  = try db!.pluck(userid)
//            let newuser = User(id: (user?[UserId])!, UserFirstName: (user?[UserName])!, UserLastName: (user?[UserLastName])!,UserEmail:(user?[UserEmail])!, UserName: (user?[UserName])!, UserImage: (user?[UserImage]!)!, UserPWD: (user?[UserPWD])!, UserisActive: (user?[UserisActive])!, UserVendorCode: user?[UserVendorCode])
//            return newuser
//        }catch{
//            return nil
//        }
//
//    }
//
//
//    func queryUserbyNameandPass(username:String,pass:String) ->AppUser?{
//
//
//        do{
//            let userid  =  tblUser.filter(UserName == username && UserPWD == pass)
//
//            if  let user  = try db?.pluck(userid){
//                let newuser =  User(id: (user[UserId]), UserFirstName: (user[UserName]), UserLastName: (user[UserLastName]),UserEmail:user[UserEmail], UserName: (user[UserName]), UserImage: (user[UserImage]!), UserPWD: (user[UserPWD]), UserisActive: (user[UserisActive]), UserVendorCode: user[UserVendorCode])
//                    return newuser
//                }else{
//            return nil
//            }
//        }catch{
//            return nil
//        }
//    }
//
//
//
//    func updateUser(id:Int64, user: AppUser) -> Bool {
//        let Usertbl = tblUser.filter(UserId == id)
//        do {
//            let update = Usertbl.update([
//                UserFirstName <- user.UserFirstName,UserLastName <- user.UserLastName,UserEmail <- user.UserEmail,UserName <- user.UserName , UserImage <- user.UserImage
//                ,UserPWD <- user.UserPWD , UserisActive <- user.UserisActive
//                ])
//            if try db!.run(update) > 0 {
//                print("Update item successfully")
//                return true
//            }
//        } catch {
//            print("Update failed: \(error)")
//        }
//
//        return false
//    }
    
    
//    func login(username:String,pass:String)-> Bool{
//        
//        
//    
//    }
    
    
    
    //////////// End of User //////////////
    
    
    
    
    //////// Laps //////////////
    
    
    private let tblLap = Table("Lap")
    private let LapId = Expression<Int64>("id")
    private let lapTaskId  = Expression<Int64>("taskId")
    //private let LineUserId = Expression<Int64>("UserId")
    private let seconds = Expression<Int>("seconds")
    private let lapCreatedDate = Expression<Date>("CreatedDate")
    
    func createLapTable() {
        do {
            try db!.run(tblLap.create(ifNotExists: false) { table in
                table.column(LapId, primaryKey: true)
                table.column(lapTaskId,references:tblTasks,taskID)
                table.column(seconds)
                table.column(lapCreatedDate)
                
            })
            print("create Lab table successfully")
        } catch {
            print("Unable to create Lab table")
            print(error)
        }
    }
    
    
    
    func addLap(lap:Lap) -> Int64? {
        do {
            let insert = tblLap.insert(lapTaskId <- lap.taskID!, seconds <- lap.seconds , lapCreatedDate <- lap.date!)
            let id = try db?.run(insert)
            print("Insert to tblLine successfully")
            return id
        } catch {
            print("Cannot insert to tblLine ")
            print(error)
            return nil
        }
    }
    
    
    func queryLapById(id:Int64) -> Lap? {
        do{
            let laptbl  = tblLap.filter(LapId == id)
            let lap  = try db?.pluck(laptbl)
            let newLap = Lap(ID: lap?[LapId], taskID: lap?[lapTaskId], seconds: lap![seconds], date: lap?[lapCreatedDate])
            return newLap
        }catch{
            return nil
        }
        
    }
    

    func queryTaskLaps(taskId:Int64)->[Lap]{
        var laps:[Lap] = []
            do {
                for lap in try db!.prepare(self.tblLap.filter(lapTaskId == taskId)) {
                    let newLap = Lap(ID: lap[LapId], taskID: lap[lapTaskId], seconds: lap[seconds], date: lap[lapCreatedDate])
                    laps.append(newLap)
                }
            } catch {
                print("Cannot get list of Laps")
            }
            return laps
    }
    
    
    
    func deleteLap(Id: Int64) -> Bool {
        do {
            let tblFilterLap = tblLap.filter(LapId == Id)
            try db?.run(tblFilterLap.delete())
            print("delete sucessfully")
            return true
        } catch {
            
            print("Delete failed")
        }
        return false
    }
    
    
    ///////////// End of Laps ////////
    
  
    
}
