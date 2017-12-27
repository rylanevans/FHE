//
//  Spotlight.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func generateSpotlight() {
    getAllTasks()
    let spotlight = Spotlight(context: context)
    spotlight.selectedOne = taskSpotlight
    spotlight.title = "Affirmations"
    spotlight.detail = "We've noticed something you did in one of the following ways of life:\n\n1. Emotional\n2. Financial\n3. Intellectual\n4. Social\n5. Occupational\n6. Physical\n7. Environmental\n8. Spiritual"
    spotlight.selected = true
    
    ad.saveContext()
}
