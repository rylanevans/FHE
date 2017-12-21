//
//  TaskController.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var tasksAllArray = [Task]()
var tasksEnabledArray = [Task]()

func getAllTasks() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let sortByDefaultNumber = NSSortDescriptor(key: "defaultNumber", ascending: true)
    fetchRequest.sortDescriptors = [sortByDefaultNumber]
    
    do {
        tasksAllArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getEnabledTasks() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "enabled == %@", NSNumber(booleanLiteral: true))
    let sortByDefaultNumber = NSSortDescriptor(key: "defaultNumber", ascending: true)
    fetchRequest.predicate = predicate
    fetchRequest.sortDescriptors = [sortByDefaultNumber]
    
    do {
        tasksEnabledArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
