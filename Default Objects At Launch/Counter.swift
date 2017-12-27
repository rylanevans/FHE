//
//  Counter.swift
//  FHE
//
//  Created by Rylan Evans on 11/15/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func beginOpenedCounter(){
    let counter = Counter(context: context)
    counter.launched = 1
    counter.hideAboutMe = false
    counter.hideSharedRequest = false
    counter.hideFeedbackRequest = false
    
    counter.feedbackGiven = false
    counter.shared = false
    counter.tipGiven = false
    
    ad.saveContext()
    
    let fetchRequest: NSFetchRequest<Counter> = Counter.fetchRequest()
    
    do {
        counterArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
