//
//  CPrayer+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 10/11/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension CPrayer {
    convenience init(cPrayerAssignmentOrder: Int64, cPrayerImage: UIImage, cPrayerTitle: String, cPrayerDetail: String, cPrayerActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.cPrayerAssignmentOrder = cPrayerAssignmentOrder
        self.cPrayerImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Prayer"))
        self.cPrayerTitle = cPrayerTitle
        self.cPrayerDetail = cPrayerDetail
        self.cPrayerActive = cPrayerActive
    }
}
