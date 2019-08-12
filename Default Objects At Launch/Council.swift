//
//  Council.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func generateCouncils() {
    getAllTasks()
    let council = Council(context: context)
    council.selectedOne = taskCouncil
    council.title = "Family Meeting"
    council.detail = "“If people don't weigh in, they can't buy in.”\n\n- Patrick Lencioni"
    council.url = "https://www.churchofjesuschrist.org/blog/bc/images/family-councils-cheat-sheet.pdf"
    council.selected = true
    
    ad.saveContext()
}
