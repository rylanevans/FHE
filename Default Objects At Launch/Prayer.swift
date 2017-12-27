//
//  Prayer.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func generatePray() {
    getAllTasks()
    let prayer = Prayer(context: context)
    prayer.title = "Steps To Prayer"
    prayer.detail = "1. Address Heavenly Father\n2. Share Gratitude\n3. Ask for needs\n4. Close in Jesus Christ's name"
    prayer.selected = true
    prayer.selectedOne = taskPrayer
    prayer.selectedClose = taskPrayerClosing
        
    ad.saveContext()
}

