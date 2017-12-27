//
//  TestimonyController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var testimoniesArray = [Testimony]()
let taskTestimony = tasksAllArray[5]

func getTestimonys() {
    let request: NSFetchRequest<Testimony> = Testimony.fetchRequest()
    do {
        testimoniesArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
