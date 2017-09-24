//
//  Prayer+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//


import CoreData

extension Prayer {
    convenience init(prayerTitle: String, prayerDetail: String, prayerActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)

        self.prayerTitle = prayerTitle
        self.prayerDetail = prayerDetail
        self.prayerActive = prayerActive
    }
}
