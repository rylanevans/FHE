//
//  Council+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Council {
    convenience init(councilTitle: String, councilDetail: String, councilActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.councilTitle = councilTitle
        self.councilDetail = councilDetail
        self.councilActive = councilActive
    }
}

