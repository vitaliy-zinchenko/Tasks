//
//  Task+CoreDataProperties.swift
//  Tasks
//
//  Created by Vitalii Zinchenko on 14.06.2020.
//  Copyright © 2020 Vitalii Zinchenko. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var text: String?

}
