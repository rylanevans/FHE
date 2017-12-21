//
//  CouncilController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var councilsArray = [Council]()
var taskCouncilsArray = [Task]()
let taskCouncil = tasksAllArray[10]

func getCouncils() {
    let request: NSFetchRequest<Council> = Council.fetchRequest()
    do {
        councilsArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskCouncil() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Council")
    fetchRequest.predicate = predicate
    
    do {
        taskCouncilsArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
