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
    convenience init(order: Int64, title: String, detail: String, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.order = order
        self.title = title
        self.detail = detail
    }
}
