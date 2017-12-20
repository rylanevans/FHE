//
//  PrayerController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var prayersArray = [Prayer]()

func getPrayers() {
    let request: NSFetchRequest<Prayer> = Prayer.fetchRequest()
    do {
        prayersArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
