//
//  Calendar+Convience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Calendar {
    convenience init(calendarTitle: String, calendarDetail: String, calendarActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.calendarTitle = calendarTitle
        self.calendarDetail = calendarDetail
        self.calendarActive = calendarActive
    }
}

