//
//  Task+CoreDataClass.swift
//  Tasks
//
//  Created by Vitalii Zinchenko on 14.06.2020.
//  Copyright © 2020 Vitalii Zinchenko. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Task)
public class Task: NSManagedObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }
    
    @nonobjc public class func getAll() -> [Task] {
        do {
            let tasks = try AppDelegate.persistentContainer.viewContext.fetch(Task.fetchRequest()) as! [Task]
            return tasks
        } catch {
            fatalError("Failed to fetch: \(error)")
        }
    }
    
//    @nonobjc public class func delete() {
//        AppDelegate.persistentContainer.viewContext.delete(object: )
//    }

}
