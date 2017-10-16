//
//  Member+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//


import CoreData
import UIKit

extension Member {
    convenience init(dateCreted: Date, order: Int64, photo: UIImage, name: String, age: String, attending: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.dateCreated = dateCreated
        self.order = order
        self.photo = UIImagePNGRepresentation(photo)
        self.name = name
        self.age = age
        self.attending = attending
    }
}
