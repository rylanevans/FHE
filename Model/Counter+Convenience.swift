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
    convenience init(launched: Int64, hideAboutMe: Bool, feedbackGiven: Bool, tipGiven: Bool, shared: Bool, hideFeedbackRequest: Bool, hideSharedRequest: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.feedbackGiven = feedbackGiven
        self.tipGiven = tipGiven
        self.hideAboutMe = hideAboutMe
        self.launched = launched
        self.shared = shared
        self.hideFeedbackRequest = hideFeedbackRequest
        self.hideSharedRequest = hideSharedRequest
    }
}
