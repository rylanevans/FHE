//
//  Lesson+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Lesson {
    convenience init(selected: Bool, favorite: Bool, category: String, alphabet: String, sortingIndex: Int64, random: Int64, order: Int64, dateCreated: Date, topic: String, title: String, detail: String, url: String, youTubeVideo: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.favorite = favorite
        self.selected = selected
        self.alphabet = alphabet
        self.category = category
        self.random = random
        self.sortingIndex = sortingIndex
        self.order = order
        self.dateCreated = dateCreated
        self.topic = topic
        self.title = title
        self.detail = detail
        self.url = url
        self.youTubeVideo = youTubeVideo
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        self.dateCreated = NSDate() as Date
    }
}
