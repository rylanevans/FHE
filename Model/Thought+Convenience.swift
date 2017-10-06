//
//  Thought+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Thought {
    convenience init(thoughtAssignmentOrder: Int64, thoughtImage: UIImage, thoughtTitle: String, thoughtDetail: String, thoughtActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.thoughtAssignmentOrder = thoughtAssignmentOrder
        self.thoughtImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Thought"))
        self.thoughtTitle = thoughtTitle
        self.thoughtDetail = thoughtDetail
        self.thoughtActive = thoughtActive
    }
}
