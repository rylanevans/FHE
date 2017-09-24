//
//  Treat+Convience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Treat {
    convenience init(treatCategory: String, treatTitle: String, treatDetail: String, treatURL: String, treatActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.treatCategory = treatCategory
        self.treatTitle = treatTitle
        self.treatDetail = treatDetail
        self.treatURL = treatURL
        self.treatActive = treatActive
    }
}
