//
//  ScriptureController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var scripturesArray = [Scripture]()
var taskScripturesArray = [Task]()
let taskScripture = tasksAllArray[3]

func getScriptures() {
    let request: NSFetchRequest<Scripture> = Scripture.fetchRequest()
    do {
        scripturesArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskScripture() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Scripture")
    fetchRequest.predicate = predicate
    
    do {
        taskScripturesArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
