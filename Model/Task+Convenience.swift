//
//  Task+Convenence.swift
//  FHE
//
//  Created by Rylan Evans on 10/17/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//
//

import CoreData
import UIKit

extension Task {
    
    convenience init(sort: String, enabled: Bool, name: String, order: Int64, assigned: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.enabled = enabled
        self.assigned = assigned
        self.name = name
        self.order = order
    }
}
