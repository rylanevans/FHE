//
//  Rule+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Rule {
    convenience init(selected: Bool, order: Int64, title: String, detail: String, dateCreated: Date, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.selected = selected
        self.order = order
        self.title = title
        self.detail = detail
        self.dateCreated = dateCreated
    }
}
