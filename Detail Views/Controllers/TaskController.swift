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
var arrayOfEnabledAndNotAssignedTasks = [Task]()

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

func getArrayOfEnabledAndNotAssignedTasks() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let enabled = NSPredicate(format: "enabled == %@", NSNumber(booleanLiteral: true))
    let assigned = NSPredicate(format: "assigned == %@", NSNumber(booleanLiteral: false))
    let sortByDefaultNumber = NSSortDescriptor(key: "defaultNumber", ascending: true)
    let predicateCompound = NSCompoundPredicate(type: .or, subpredicates: [enabled, assigned])
    fetchRequest.predicate = predicateCompound
    fetchRequest.sortDescriptors = [sortByDefaultNumber]
    
    do {
        arrayOfEnabledAndNotAssignedTasks = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func runAssignments() {
    getArrayOfAttendingMembersAutoAssignOrder()
    getArrayOfEnabledAndNotAssignedTasks()
    var index = 0
    for eachTask in arrayOfEnabledAndNotAssignedTasks {
        if index == arrayOfAttendingMembersAutoAssignOrder.count {
            index = 0
        }
        eachTask.assignment = arrayOfAttendingMembersAutoAssignOrder[index]
        index += 1
    }
}

func autoAssignAllEnabledTasks() {
    for eachTask in tasksAllArray {
        eachTask.assigned = false
    }
    getArrayOfEnabledAndNotAssignedTasks()
    getArrayOfAttendingMembersAutoAssignOrder()
    runAssignments()
}

func rotateAllAutoAssignedTasks() {
    getArrayOfAttendingMembersAutoAssignOrder()
    getArrayOfEnabledAndNotAssignedTasks()
    var index = Int(counter.rotationIndex)
    let count = arrayOfAttendingMembersAutoAssignOrder.count
    if index > count {
        index = 0
    }
        let element = arrayOfAttendingMembersAutoAssignOrder.remove(at: index)
        arrayOfAttendingMembersAutoAssignOrder.insert(element, at: 0)
        runAssignments()
}
