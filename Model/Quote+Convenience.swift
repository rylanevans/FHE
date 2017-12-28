//
//  Quote+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Quote {
    convenience init(selected: Bool, favorite: Bool, alphabet: String, sortingIndex: Int64, random: Int64, order: Int64, dateCreated: Date, title: String, detail: String, url: String, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.favorite = favorite
        self.selected = selected
        self.alphabet = alphabet
        self.random = random
        self.sortingIndex = sortingIndex
        self.order = order
        self.dateCreated = dateCreated
        self.title = title
        self.detail = detail
        self.url = url
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.dateCreated = NSDate() as Date
    }
}
