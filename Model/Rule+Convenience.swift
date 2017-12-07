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
    convenience init(selected: Bool, sortingIndex: Int64, random: Int64, order: Int64, title: String, detail: String, dateCreated: Date, url: String, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.selected = selected
        self.sortingIndex = sortingIndex
        self.random = random
        self.order = order
        self.title = title
        self.detail = detail
        self.dateCreated = dateCreated
        self.url = url
    }
}
