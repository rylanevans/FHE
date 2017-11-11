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
    convenience init(dateCreated: Date, random: Int64, order: Int64, photo: NSObject, name: String, sortingIndex: Int64, age: Int64, attending: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.dateCreated = dateCreated
        self.order = order
        self.random = random
        self.photo = photo
        self.name = name
        self.sortingIndex = sortingIndex
        self.age = age
        self.attending = attending
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.dateCreated = NSDate() as Date
    }
}
