//
//  Testimony+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Testimony {
    convenience init(testimonyAssignmentOrder: Int64, testimonyImage: UIImage, testimonyTitle: String, testimonyDetail: String, testimonyActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.testimonyAssignmentOrder = testimonyAssignmentOrder
        self.testimonyImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Testimony"))
        self.testimonyTitle = testimonyTitle
        self.testimonyDetail = testimonyDetail
        self.testimonyActive = testimonyActive
    }
}
