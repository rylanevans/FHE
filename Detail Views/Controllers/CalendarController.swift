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
