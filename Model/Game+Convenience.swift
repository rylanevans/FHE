//
//  Game+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Game {
    convenience init(gameImage: UIImage, gameCategory: String, gameTitle: String, gameDetail: String, gameURL: String, gameActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.gameImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Game"))
        self.gameCategory = gameCategory
        self.gameTitle = gameTitle
        self.gameDetail = gameDetail
        self.gameURL = gameURL
        self.gameActive = gameActive
    }
}
