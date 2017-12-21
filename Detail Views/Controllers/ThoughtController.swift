//
//  ThoughtController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var thoughtsArray = [Thought]()
var taskThoughtsArray = [Task]()
let taskThought = tasksAllArray[7]

func getThoughts() {
    let request: NSFetchRequest<Thought> = Thought.fetchRequest()
    do {
        thoughtsArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskThought() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Thought")
    fetchRequest.predicate = predicate
    
    do {
        taskThoughtsArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
