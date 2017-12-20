//
//  TreatController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var treatsArray = [Treat]()

func getTreats() {
    let request: NSFetchRequest<Treat> = Treat.fetchRequest()
    do {
        treatsArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
