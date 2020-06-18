//
//  EntryViewController.swift
//  Tasks
//
//  Created by Vitalii Zinchenko on 08.06.2020.
//  Copyright © 2020 Vitalii Zinchenko. All rights reserved.
//

import UIKit

class TaskEditViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var field: UITextField!
    
    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        field.delegate = self
    }
    
    @IBAction func saveTask() {
        let task = Task(context: AppDelegate.persistentContainer.viewContext)
        task.text = field.text!
        task.done = false
        AppDelegate.saveContext()
        
        update!()
        navigationController?.popViewController(animated: true)
    }

}

extension TaskEditViewController {
    static func transit(_ vc: UIViewController, _ callback: @escaping () -> Void) {
        let entryVc = vc.storyboard?.instantiateViewController(identifier: "entry") as! TaskEditViewController
        entryVc.update = callback
        vc.navigationController?.pushViewController(entryVc, animated: true)
    }
}
