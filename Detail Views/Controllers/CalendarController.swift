//
//  CalendarController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var calendarsArray = [Calendar]()
var taskCalendarsArray = [Task]()
let taskCalendar = tasksAllArray[4]

func getCalendars() {
    let request: NSFetchRequest<Calendar> = Calendar.fetchRequest()
    do {
        calendarsArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskCalendar() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Calendar")
    fetchRequest.predicate = predicate
    
    do {
        taskCalendarsArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
