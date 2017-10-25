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
    convenience init(dateCreated: Date, order: Int64, photo: NSObject, name: String, age: Int64, attending: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.dateCreated = dateCreated
        self.order = order
        self.photo = photo
        self.name = name
        self.age = age
        self.attending = attending
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.dateCreated = NSDate() as Date
    }
}
