//
//  Counter+CoreDataProperties.swift
//  FHE
//
//  Created by Rylan Evans on 10/12/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//
//

import CoreData
import UIKit

extension Counter {
    convenience init(rotationIndex: Int64, facebookRequest: Bool, hideFaceBookRequest: Bool, hideSeeApps: Bool, seeApps: Bool, launched: Int64, lessonListTip: Bool, developerTip: Bool, songDetailsTip: Bool, lessonDetailsTip: Bool, prayerTip: Bool, songTip: Bool, rulesTip: Bool, spotlightTip: Bool, lessonTip: Bool, testimonyTip: Bool, familyTip: Bool, tasksTip: Bool, homeTip: Bool, hideAboutMe: Bool, feedbackGiven: Bool, tipGiven: Bool, shared: Bool, hideFeedbackRequest: Bool, hideSharedRequest: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.hideFaceBookRequest = hideFaceBookRequest
        self.facebookRequest = facebookRequest
        self.hideSeeApps = hideSeeApps
        self.seeApps = seeApps
        self.rotationIndex = rotationIndex
        self.lessonListTip = lessonListTip
        self.developerTip = developerTip
        self.songDetailsTip = songDetailsTip
        self.lessonDetailsTip = lessonDetailsTip
        self.songTip = songTip
        self.prayerTip = prayerTip
        self.rulesTip = rulesTip
        self.spotlightTip = spotlightTip
        self.lessonTip = lessonTip
        self.testimonyTip = testimonyTip
        self.familyTip = familyTip
        self.tasksTip = tasksTip
        self.homeTip = homeTip
        self.feedbackGiven = feedbackGiven
        self.tipGiven = tipGiven
        self.hideAboutMe = hideAboutMe
        self.launched = launched
        self.shared = shared
        self.hideFeedbackRequest = hideFeedbackRequest
        self.hideSharedRequest = hideSharedRequest
    }
}
