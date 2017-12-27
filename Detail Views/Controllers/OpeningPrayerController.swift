//
//  OpeningPrayerController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var prayersArray = [Prayer]()
//var taskPrayersArray = [Task]()
let taskPrayer = tasksAllArray[0]

func getPrayers() {
    let request: NSFetchRequest<Prayer> = Prayer.fetchRequest()
    do {
        prayersArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}



//func getTaskPrayer() {
//    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
//    let predicate = NSPredicate(format: "name == %@", "Prayer")
//    fetchRequest.predicate = predicate
//    
//    do {
//        taskPrayersArray = try context.fetch(fetchRequest)
//    } catch {
//        let error = error as NSError
//        print("\(error)")
//    }
//}

