//
//  Spotlight+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Spotlight {
    convenience init(title: String, detail: String, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.title = title
        self.detail = detail
    }
}
