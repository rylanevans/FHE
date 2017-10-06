//
//  Calendar+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Calendar {
    convenience init(calendarAssignmentOrder: Int64, calendarImage: UIImage, calendarTitle: String, calendarDetail: String, calendarActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.calendarAssignmentOrder = calendarAssignmentOrder
        self.calendarImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Calendar"))
        self.calendarTitle = calendarTitle
        self.calendarDetail = calendarDetail
        self.calendarActive = calendarActive
    }
}

