//
//  ViewController.swift
//  Tasks
//
//  Created by Vitalii Zinchenko on 08.06.2020.
//  Copyright © 2020 Vitalii Zinchenko. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    var tasks: [Task] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
                
        tasks = Task.getAll()
    }

    @IBAction func didTapAdd() {
        TaskEditViewController.transit(self, {
            self.update()
        })
    }
    
    private func update() {
        self.tasks = Task.getAll()
        self.tableView.reloadData()
    }
    
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        TaskInfoViewController.transit(self, task: tasks[indexPath.row], {
            self.update()
        })
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("check size")
        return tasks.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        cell.textLabel?.text = tasks[indexPath.row].text
        return cell
    }
    
}
