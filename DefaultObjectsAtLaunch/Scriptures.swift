//
//  Scriptures.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func generateScripture() {
    getAllTasks()
    let scripture1 = Scripture(context: context)
    scripture1.topic = lessonTopicsArray[0]
    scripture1.volume = "bofm"
    scripture1.book = "1-ne"
    scripture1.chapter = "3"
    scripture1.verse = "7"
    scripture1.title = "The Lord Prepares A Way"
    scripture1.favorite = true
    scripture1.order = 1
    scripture1.random = Int64(arc4random_uniform(1000))
    scripture1.selected = true
    scripture1.sortingIndex = 0
    scripture1.selectedOne = taskScripture
    
    let scripture2 = Scripture(context: context)
    scripture2.topic = lessonTopicsArray[0]
    scripture2.volume = "bofm"
    scripture2.book = "2-ne"
    scripture2.chapter = "2"
    scripture2.verse = "22-25"
    scripture2.title = "Adam Fell That Men Might Be"
    scripture2.favorite = false
    scripture2.order = 2
    scripture2.random = Int64(arc4random_uniform(1000))
    scripture2.selected = false
    scripture2.sortingIndex = 0
    
    ad.saveContext()
}
