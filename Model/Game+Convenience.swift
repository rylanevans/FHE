//
//  Game+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Game {
    convenience init(selected: Bool, favorite: Bool, random: Int64, alphabet: String, sortingIndex: Int64, order: Int64, dateCreated: Date, category: String, title: String, url: String, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.favorite = favorite
        self.selected = selected
        self.alphabet = alphabet
        self.random = random
        self.sortingIndex = sortingIndex
        self.order = order
        self.dateCreated = dateCreated
        self.category = category
        self.title = title
        self.url = url
    }
    
    public override func awakeFromInsert() {
        super.awakeFromInsert()
        
        self.dateCreated = NSDate() as Date
        if self.title != nil {
            self.alphabet = String(describing: self.title?[(self.title?.startIndex)!])
        } else {
            self.alphabet = ""
        }
//        ad.saveContext()
    }
}
