//
//  Prayer+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//


import CoreData
import UIKit

extension Prayer {
    convenience init(prayerImage: UIImage, prayerTitle: String, prayerDetail: String, prayerActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)

        self.prayerImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Prayer"))
        self.prayerTitle = prayerTitle
        self.prayerDetail = prayerDetail
        self.prayerActive = prayerActive
    }
}
