//
//  Misc+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Misc {
    convenience init(miscTitle: String, miscDetail: String, miscActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.miscTitle = miscTitle
        self.miscDetail = miscDetail
        self.miscActive = miscActive
    }
}
