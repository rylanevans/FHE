//
//  Song+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Song {
    convenience init(selected: Bool, favorite: Bool, alphabet: String, sortingIndex: Int64, topic: String, dateCreated: Date, random: Int64, order: Int64, number: Int64, title: String, book: String, url: String, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.favorite = favorite
        self.selected = selected
        self.alphabet = alphabet
        self.sortingIndex = sortingIndex
        self.topic = topic
        self.dateCreated = dateCreated
        self.random = random
        self.order = order
        self.number = number
        self.title = title
        self.book = book
        self.url = url
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.dateCreated = NSDate() as Date
    }
}

