//
//  Song+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Song {
    convenience init(songTheme: String, songTitle: String, songSource: String, songURL: String, songActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.songTheme = songTheme
        self.songTitle = songTitle
        self.songSource = songSource
        self.songURL = songURL
        self.songActive = songActive
    }
}

