//
//  Theme+Conveneince.swift
//  FHE
//
//  Created by Rylan Evans on 10/13/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Theme {
    convenience init(theme: String, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.theme = theme
    }
}
