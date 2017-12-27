//
//  ThoughtController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var thoughtsArray = [Thought]()
let taskThought = tasksAllArray[7]

func getThoughts() {
    let request: NSFetchRequest<Thought> = Thought.fetchRequest()
    do {
        thoughtsArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
