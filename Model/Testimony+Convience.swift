//
//  Testimony+Convience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Testimony {
    convenience init(testimonyTitle: String, testimonyDetail: String, testimonyActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.testimonyTitle = testimonyTitle
        self.testimonyDetail = testimonyDetail
        self.testimonyActive = testimonyActive
    }
}
