//
//  Song+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Song {
    convenience init(songDateCreated: Date, songAssignmentOrder: Int64, songImage: UIImage, songNumber: String, songTitle: String, songSource: String, songURL: String, songActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.songDateCreated = songDateCreated
        self.songAssignmentOrder = songAssignmentOrder
        self.songImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Song"))
        self.songNumber = songNumber
        self.songTitle = songTitle
        self.songSource = songSource
        self.songURL = songURL
        self.songActive = songActive
    }
}

