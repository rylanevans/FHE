//
//  Thought.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData


func generateThought() {
    getAllTasks()
    let thought = Thought(context: context)
    thought.selectedOne = taskThought
    thought.title = "I've been thinking..."
    thought.detail = "While knowledge is orderly and cumulative, information is random and miscellaneous."
    thought.url = "https://www.mormonchannel.org/watch/series/mormon-channel-studio/mormon-channel-studio-nashville-tribute-band"
    thought.selected = true
    
    ad.saveContext()
}


