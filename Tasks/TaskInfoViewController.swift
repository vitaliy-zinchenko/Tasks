    //
//  TaskViewController.swift
//  Tasks
//
//  Created by Vitalii Zinchenko on 08.06.2020.
//  Copyright © 2020 Vitalii Zinchenko. All rights reserved.
//

import UIKit

class TaskInfoViewController: UIViewController {
    
    @IBOutlet var taskLabel: UILabel!
    
    var task: Task?
    
    var callback: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        taskLabel.text = task?.text
    }
    
    @IBAction func deleteTask() {
        AppDelegate.persistentContainer.viewContext.delete(task!)
        
        navigationController?.popViewController(animated: true)
        AppDelegate.saveContext()
        callback!()
    }
}
    
extension TaskInfoViewController {

    static func transit(_ vc: UIViewController, task: Task, _ callback: @escaping () -> Void) {
        let taskVc = vc.storyboard?.instantiateViewController(identifier: "task") as! TaskInfoViewController
        taskVc.task = task
        taskVc.callback = callback
        vc.navigationController?.pushViewController(taskVc, animated: true)
    }
    
}
