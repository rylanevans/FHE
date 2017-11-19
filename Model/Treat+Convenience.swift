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
    convenience init(selected: Bool, favorite: Bool, sortingIndex: Int64, random: Int64, order: Int64, dateCreated: Date, category: String, title: String, url: String, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.favorite = favorite
        self.selected = selected
        self.sortingIndex = sortingIndex
        self.random = random
        self.order = order
        self.dateCreated = dateCreated
        self.category = category
        self.title = title
        self.url = url
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.dateCreated = NSDate() as Date
    }
}
