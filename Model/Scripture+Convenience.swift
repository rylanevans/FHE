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
    convenience init(selected: Bool, order: Int64, topic: String, volume: String, book: String, chapter: String, verse: String, title: String, dateCreated: Date, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.selected = selected
        self.order = order
        self.topic = topic
        self.title = title
        self.volume = volume
        self.book = book
        self.chapter = chapter
        self.verse = verse
        self.dateCreated = dateCreated
    }
}

