//
//  Prayer+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 10/11/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Prayer {
    convenience init(title: String, detail: String, selected: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)

        self.title = title
        self.detail = detail
        self.selected = selected
    }
}
