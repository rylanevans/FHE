//
//  Spotlight+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Spotlight {
    convenience init(spotlightTitle: String, spotlightDetail: String, spotlightActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.spotlightTitle = spotlightTitle
        self.spotlightDetail = spotlightDetail
        self.spotlightActive = spotlightActive
    }
}

