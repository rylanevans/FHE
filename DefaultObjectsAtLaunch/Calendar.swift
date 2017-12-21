//
//  Calendar.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

func generateCalendar() {
    getAllTasks()
    let calendar = Calendar(context: context)
    calendar.selectedOne = taskCalendar
    calendar.title = "Planning Meeting"
    calendar.detail = "Upcoming events:\n\n1. Activities\n2. Birthdays / Holidays\n3. Traveling / Vacations\n4. Family dinners"
    calendar.selected = true
    
    ad.saveContext()
}
