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
    let notAssigned = NSPredicate(format: "assigned == %@", NSNumber(booleanLiteral: false))
    let sortByDefaultNumber = NSSortDescriptor(key: "defaultNumber", ascending: true)
    let predicateCompound = NSCompoundPredicate(type: .and, subpredicates: [enabled, notAssigned])
    
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
    
    if membersAttendingArray.count == 0 {
        arrayOfAttendingMembersAutoAssignOrder = membersPickerArray
    }
    
    var index = 0
    for eachTask in arrayOfEnabledAndNotAssignedTasks {
        if index >= arrayOfAttendingMembersAutoAssignOrder.count {
            index = 0
        }
        eachTask.assignment = arrayOfAttendingMembersAutoAssignOrder[index]
        index += 1
    }
}

func runAssignmentsYoungestToOldest() {
    getMembersAttending()
    getArrayOfAttendingMembersAutoAssignOrder()
    getArrayOfEnabledAndNotAssignedTasks()
    
    if membersAttendingArray.count == 0 {
        arrayOfAttendingMembersAutoAssignOrder = membersPickerArray
    } else {
        arrayOfAttendingMembersAutoAssignOrder = membersAttendingArray
    }
    
    var i = 0
    for eachTask in arrayOfAttendingMembersAutoAssignOrder {
        eachTask.order = Int64(i)
        ad.saveContext()
        i += 1
    }
    
    var index = 0
    for eachTask in arrayOfEnabledAndNotAssignedTasks {
        if index >= arrayOfAttendingMembersAutoAssignOrder.count {
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
    runAssignmentsYoungestToOldest()
}

func rotateAllAutoAssignedTasks() {
    getArrayOfAttendingMembersAutoAssignOrder()
    getArrayOfEnabledAndNotAssignedTasks()
    let count = arrayOfAttendingMembersAutoAssignOrder.count
    let element = arrayOfAttendingMembersAutoAssignOrder.remove(at: (count - 1))
    arrayOfAttendingMembersAutoAssignOrder.insert(element, at: 0)
    var index = 0
    for eachTask in arrayOfAttendingMembersAutoAssignOrder {
        eachTask.order = Int64(index)
        ad.saveContext()
        index += 1
    }
    runAssignments()
}

