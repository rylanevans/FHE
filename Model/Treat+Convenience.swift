//
//  Treat+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Treat {
    convenience init(order: Int64, dateCreated: UIImage, category: String, title: String, detail: String, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.order = order
        self.dateCreated = dateCreated
        self.category = category
        self.title = title
        self.detail = detail
    }
}
