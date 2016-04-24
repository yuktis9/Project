////
////  TasksViewController.swift
////  Project
////
////  Created by yukti sarwadia on 4/21/16.
////  Copyright © 2016 yukti sarwadia. All rights reserved.
////
//
//
import UIKit
import RealmSwift

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var selectedList : TaskList!
    var openTasks : Results<Task>!
    var completedTasks : Results<Task>!
    var currentCreateAction:UIAlertAction!
    
    var isEditingMode = false
    
    // Get the default Realm
    let realm = try! Realm()
  
    
    @IBOutlet weak var tasksTableView: UITableView!
    
//    override func viewWillAppear(animated: Bool) {
//        self.navigationController?.navigationItem.hidesBackButton = true
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let save = UIBarButtonItem(barButtonSystemItem: .Save, target: self, action: Selector("btnOpenCamera"))
//        self.navigationItem.rightBarButtonItem = save
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickOnEditTasks(sender: AnyObject) {
        isEditingMode = !isEditingMode
        self.tasksTableView.setEditing(isEditingMode, animated: true)
    }
    
    @IBAction func didClickOnNewTask(sender: AnyObject) {
        self.displayAlertToAddTask(nil)

    }
    // MARK: - UITableViewDataSource -
//    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        return 2
//    }
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//        if section == 0{
//            return openTasks.count
//        }
//        return completedTasks.count
//    }
//    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        
//        if section == 0{
//            return "OPEN TASKS"
//        }
//        return "COMPLETED TASKS"
//    }
//    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
//        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
//        var task: Task!
//        if indexPath.section == 0{
//            task = openTasks[indexPath.row]
//        }
//        else{
//            task = completedTasks[indexPath.row]
//        }
//        
//        cell?.textLabel?.text = task.name
//        return cell!
//    }
//    
//    
//    func displayAlertToAddTask(updatedTask:Task!){
//        
//        var title = "New Task"
//        var doneTitle = "Create"
//        if updatedTask != nil{
//            title = "Update Task"
//            doneTitle = "Update"
//        }
//        
//        let alertController = UIAlertController(title: title, message: "Write the name of your task.", preferredStyle: UIAlertControllerStyle.Alert)
//        let createAction = UIAlertAction(title: doneTitle, style: UIAlertActionStyle.Default) { (action) -> Void in
//            
//            let taskName = alertController.textFields?.first?.text
//            
//            if updatedTask != nil{
////                // update mode
////                try! self.realm.write
////                    updatedTask.name = taskName!
////                    self.readTasksAndUpateUI()
////                })
//                
//                try! self.realm.write {
//                    self.realm.add(updatedTask,update: true)
//                }
//            }
//            else{
//                
//                let newTask = Task()
//                newTask.name = taskName!
//                
//                try! self.realm.write {
//                    self.realm.add(newTask)
//   
//                    
////                    uiRealm.write({ () -> Void in
////
////                    self.selectedList.tasks.append(newTask)
////                    self.readTasksAndUpateUI()
////                })
//            }
//            
//            print(taskName)
//        }
//        }
//    }
////        alertController.addAction(createAction)
////        createAction.enabled = false
////        self.currentCreateAction = createAction
////        
////        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
////        
////        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
////            textField.placeholder = "Task Name"
////            textField.addTarget(self, action: "taskNameFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
////            if updatedTask != nil{
////                textField.text = updatedTask.name
////            }
////        }
////        
////        self.presentViewController(alertController, animated: true, completion: nil)
////    }
//    
//    //Enable the create action of the alert only if textfield text is not empty
//    func taskNameFieldDidChange(textField:UITextField){
//        self.currentCreateAction.enabled = textField.text?.characters.count > 0
//    }
//    
//    
//    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
//
//        
//        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive, title: "Delete") { (deleteAction, indexPath) -> Void in
//            
//            //Deletion will go here
//            
//            var taskToBeDeleted: Task!
//            if indexPath.section == 0{
//                taskToBeDeleted = self.openTasks[indexPath.row]
//            }
//            else{
//                taskToBeDeleted = self.completedTasks[indexPath.row]
//            }
//            try! self.realm.write {
//                self.realm.delete(taskToBeDeleted)
////            do
////            {
////                try uiRealm.write({ () -> Void in
////                uiRealm.delete(taskToBeDeleted)
////                self.readTasksAndUpateUI()
////            })} catch {
////                print("error")
////            }
//        }
//        }
//        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Edit") { (editAction, indexPath) -> Void in
//            
//            // Editing will go here
//            var taskToBeUpdated: Task!
//            if indexPath.section == 0{
//                taskToBeUpdated = self.openTasks[indexPath.row]
//            }
//            else{
//                taskToBeUpdated = self.completedTasks[indexPath.row]
//            }
//            
//            self.displayAlertToAddTask(taskToBeUpdated)
//            
//        }
//        
//        let doneAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Done") { (doneAction, indexPath) -> Void in
//            // Editing will go here
//            var taskToBeUpdated: Task!
//            if indexPath.section == 0{
//                taskToBeUpdated = self.openTasks[indexPath.row]
//            }
//            else{
//                taskToBeUpdated = self.completedTasks[indexPath.row]
//            }
//                try! self.realm.write {
//                taskToBeUpdated.isCompleted = true
//                self.realm.add(taskToBeUpdated, update: true)
//                    
////                uiRealm.write({ () -> Void in
////                self.readTasksAndUpateUI()
////                })}
//          
//            
//            }
//        }
//        
//        return [deleteAction, editAction, doneAction]
//        //    return abc
//    }
//
//}
    func readTasksAndUpateUI(){
        
        completedTasks = self.selectedList.tasks.filter("isCompleted = true")
        openTasks = self.selectedList.tasks.filter("isCompleted = false")
        
        self.tasksTableView.reloadData()
    }
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
    
    
    // MARK: - UITableViewDataSource -
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if section == 0{
            return openTasks.count
        }
        return completedTasks.count
    }
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if section == 0{
            return "OPEN TASKS"
        }
        return "COMPLETED TASKS"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        var task: Task!
        if indexPath.section == 0{
            task = openTasks[indexPath.row]
        }
        else{
            task = completedTasks[indexPath.row]
        }
        
        cell?.textLabel?.text = task.name
        return cell!
    }
    
    
    func displayAlertToAddTask(updatedTask:Task!){
        
        var title = "New Task"
        var doneTitle = "Create"
        if updatedTask != nil{
            title = "Update Task"
            doneTitle = "Update"
        }
        
        let alertController = UIAlertController(title: title, message: "Write the name of your task.", preferredStyle: UIAlertControllerStyle.Alert)
        let createAction = UIAlertAction(title: doneTitle, style: UIAlertActionStyle.Default) { (action) -> Void in
            
            let taskName = alertController.textFields?.first?.text
            
            if updatedTask != nil{
                // update mode
               try! uiRealm.write({ () -> Void in
                    updatedTask.name = taskName!
                    self.readTasksAndUpateUI()
                })
            }
            else{
                
                var newTask = Task()
                newTask.name = taskName!
                
               try! uiRealm.write({ () -> Void in
                    
                    self.selectedList.tasks.append(newTask)
                    self.readTasksAndUpateUI()
                })
            }
            
            
            
            print(taskName)
        }
        
        alertController.addAction(createAction)
        createAction.enabled = false
        self.currentCreateAction = createAction
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        
        alertController.addTextFieldWithConfigurationHandler { (textField) -> Void in
            textField.placeholder = "Task Name"
            textField.addTarget(self, action: "taskNameFieldDidChange:", forControlEvents: UIControlEvents.EditingChanged)
            if updatedTask != nil{
                textField.text = updatedTask.name
            }
        }
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    //Enable the create action of the alert only if textfield text is not empty
    func taskNameFieldDidChange(textField:UITextField){
        self.currentCreateAction.enabled = textField.text?.characters.count > 0
    }
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: UITableViewRowActionStyle.Destructive, title: "Delete") { (deleteAction, indexPath) -> Void in
            
            //Deletion will go here
            
            var taskToBeDeleted: Task!
            if indexPath.section == 0{
                taskToBeDeleted = self.openTasks[indexPath.row]
            }
            else{
                taskToBeDeleted = self.completedTasks[indexPath.row]
            }
            
           try! uiRealm.write({ () -> Void in
                uiRealm.delete(taskToBeDeleted)
                self.readTasksAndUpateUI()
            })
        }
        let editAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Edit") { (editAction, indexPath) -> Void in
            
            // Editing will go here
            var taskToBeUpdated: Task!
            if indexPath.section == 0{
                taskToBeUpdated = self.openTasks[indexPath.row]
            }
            else{
                taskToBeUpdated = self.completedTasks[indexPath.row]
            }
            
            self.displayAlertToAddTask(taskToBeUpdated)
            
        }
        
        let doneAction = UITableViewRowAction(style: UITableViewRowActionStyle.Normal, title: "Done") { (doneAction, indexPath) -> Void in
            // Editing will go here
            var taskToBeUpdated: Task!
            if indexPath.section == 0{
                taskToBeUpdated = self.openTasks[indexPath.row]
            }
            else{
                taskToBeUpdated = self.completedTasks[indexPath.row]
            }
          try!  uiRealm.write({ () -> Void in
                taskToBeUpdated.isCompleted = true
                self.readTasksAndUpateUI()
            })
            
        }
        return [deleteAction, editAction, doneAction]
}
}