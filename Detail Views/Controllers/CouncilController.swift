//
//  CouncilController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var councilsArray = [Council]()

func getCouncils() {
    let request: NSFetchRequest<Council> = Council.fetchRequest()
    do {
        councilsArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
