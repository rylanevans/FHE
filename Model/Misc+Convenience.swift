//
//  Misc+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Misc {
    convenience init(title: String, detail: String, url: String, selected: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.url = url
        self.title = title
        self.detail = detail
        self.selected = selected
    }
}
