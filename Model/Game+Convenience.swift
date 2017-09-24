//
//  Game+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Game {
    convenience init(gameCategory: String, gameTitle: String, gameDetail: String, gameURL: String, gameActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.gameCategory = gameCategory
        self.gameTitle = gameTitle
        self.gameDetail = gameDetail
        self.gameURL = gameURL
        self.gameActive = gameActive
    }
}
