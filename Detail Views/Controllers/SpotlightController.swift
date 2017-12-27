//
//  SpotlightController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var spotlightsArray = [Spotlight]()
let taskSpotlight = tasksAllArray[6]

func getSpotlights() {
    let request: NSFetchRequest<Spotlight> = Spotlight.fetchRequest()
    do {
        spotlightsArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
