//
//  OPrayer+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//


import CoreData
import UIKit

extension OPrayer {
    convenience init(oPrayerAssignmentOrder: Int64, oPrayerImage: UIImage, oPrayerTitle: String, oPrayerDetail: String, oPrayerActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)

        self.oPrayerAssignmentOrder = oPrayerAssignmentOrder
        self.oPrayerImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Prayer"))
        self.oPrayerTitle = oPrayerTitle
        self.oPrayerDetail = oPrayerDetail
        self.oPrayerActive = oPrayerActive
    }
}
