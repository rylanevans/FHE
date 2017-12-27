//
//  RuleController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var rulesArray = [Rule]()
let taskRule = tasksAllArray[2]

func getRules() {
    let request: NSFetchRequest<Rule> = Rule.fetchRequest()
    do {
        rulesArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
