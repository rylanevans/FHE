//
//  Counter+CoreDataProperties.swift
//  FHE
//
//  Created by Rylan Evans on 10/12/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//
//

import CoreData
import UIKit

extension Counter {
    convenience init(launched: Int64, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.launched = launched
    }
}
