//
//  TreatController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var treatsArray = [Treat]()
var taskTreatsArray = [Task]()
let taskTreat = tasksAllArray[12]

func getTreats() {
    let request: NSFetchRequest<Treat> = Treat.fetchRequest()
    do {
        treatsArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskTreat() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Treat")
    fetchRequest.predicate = predicate
    
    do {
        taskTreatsArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
