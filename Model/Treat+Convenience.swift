//
//  Treat+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Treat {
    convenience init(treatAssignmentOrder: Int64, treatImage: UIImage, treatCategory: String, treatTitle: String, treatDetail: String, treatActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.treatAssignmentOrder = treatAssignmentOrder
        self.treatImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Treat"))
        self.treatCategory = treatCategory
        self.treatTitle = treatTitle
        self.treatDetail = treatDetail
        self.treatActive = treatActive
    }
}
