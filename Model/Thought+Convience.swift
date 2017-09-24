//
//  Thought+Convience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Thought {
    convenience init(thoughtTitle: String, thoughtDetail: String, thoughtActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.thoughtTitle = thoughtTitle
        self.thoughtDetail = thoughtDetail
        self.thoughtActive = thoughtActive
    }
}
