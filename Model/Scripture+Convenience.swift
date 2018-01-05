//
//  Scripture+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Scripture {
    convenience init(selected: Bool, favorite: Bool, alphabet: String, sortingIndex: Int64, random: Int64, order: Int64, topic: String, volume: String, book: String, chapter: Int64, verse: String, title: String, dateCreated: Date, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.favorite = favorite
        self.selected = selected
        self.alphabet = alphabet
        self.sortingIndex = sortingIndex
        self.random = random
        self.order = order
        self.topic = topic
        self.title = title
        self.volume = volume
        self.book = book
        self.chapter = chapter
        self.verse = verse
        self.dateCreated = dateCreated
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.dateCreated = NSDate() as Date
    }
}

