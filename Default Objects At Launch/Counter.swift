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
    counter.hideSeeApps = false
    counter.hideFaceBookRequest = false
    counter.feedbackGiven = false
    counter.shared = false
    counter.tipGiven = false
    counter.songTip = false
    counter.rulesTip = false
    counter.spotlightTip = false
    counter.lessonTip = false
    counter.testimonyTip = false
    counter.familyTip = false
    counter.tasksTip = false
    counter.homeTip = false
    counter.songDetailsTip = false
    counter.lessonDetailsTip = false
    counter.lessonListTip = false
    counter.developerTip = false
    counter.seeApps = false
    counter.facebookRequest = false
    
    counter.rotationIndex = 0
    
    ad.saveContext()
    
    let fetchRequest: NSFetchRequest<Counter> = Counter.fetchRequest()
    
    do {
        counterArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
