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
    convenience init(spotlight: UIImage, spotlightTitle: String, spotlightDetail: String, spotlightActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.spotlightImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Spotlight"))
        self.spotlightTitle = spotlightTitle
        self.spotlightDetail = spotlightDetail
        self.spotlightActive = spotlightActive
    }
}

