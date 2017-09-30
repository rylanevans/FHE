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
    convenience init(treatImage: UIImage, treatCategory: String, treatTitle: String, treatDetail: String, treatURL: String, treatActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.treatImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Treat"))
        self.treatCategory = treatCategory
        self.treatTitle = treatTitle
        self.treatDetail = treatDetail
        self.treatURL = treatURL
        self.treatActive = treatActive
    }
}
