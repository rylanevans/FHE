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
    scripture1.volume = "ot"
    scripture1.book = "gen"
    scripture1.chapter = "2"
    scripture1.verse = "24"
    scripture1.title = "Husband and Wife are to be One"
    scripture1.favorite = false
    scripture1.order = 1
    scripture1.random = Int64(arc4random_uniform(1000))
    scripture1.selected = false
    scripture1.sortingIndex = 0
    scripture1.alphabet = String(describing: scripture1.title![(scripture1.title!.startIndex)])
    scripture1.order = Int64(defaultScriptureDictionary["\(scripture1.book ?? "gen")"]!)
    
    let scripture2 = Scripture(context: context)
    scripture2.topic = lessonTopicsArray[0]
    scripture2.volume = "nt"
    scripture2.book = "matt"
    scripture2.chapter = "5"
    scripture2.verse = "14-16"
    scripture2.title = "Light of the World"
    scripture2.favorite = false
    scripture2.order = 2
    scripture2.random = Int64(arc4random_uniform(1000))
    scripture2.selected = false
    scripture2.sortingIndex = 0
    scripture2.alphabet = String(describing: scripture2.title![(scripture2.title!.startIndex)])
    scripture2.order = Int64(defaultScriptureDictionary["\(scripture2.book ?? "gen")"]!)
    
    let scripture3 = Scripture(context: context)
    scripture3.topic = lessonTopicsArray[0]
    scripture3.volume = "bofm"
    scripture3.book = "1-ne"
    scripture3.chapter = "3"
    scripture3.verse = "7"
    scripture3.title = "The Lord Prepares A Way"
    scripture3.favorite = false
    scripture3.order = 1
    scripture3.random = Int64(arc4random_uniform(1000))
    scripture3.selected = true
    scripture3.sortingIndex = 0
    scripture3.alphabet = String(describing: scripture3.title![(scripture3.title!.startIndex)])
    scripture3.order = Int64(defaultScriptureDictionary["\(scripture3.book ?? "gen")"]!)
    scripture3.selectedOne = taskScripture
    
    let scripture4 = Scripture(context: context)
    scripture4.topic = lessonTopicsArray[0]
    scripture4.volume = "dc"
    scripture4.book = "dc"
    scripture4.chapter = "1"
    scripture4.verse = "30"
    scripture4.title = "Only True and Living Church"
    scripture4.favorite = true
    scripture4.order = 1
    scripture4.random = Int64(arc4random_uniform(1000))
    scripture4.selected = false
    scripture4.sortingIndex = 0
    scripture4.alphabet = String(describing: scripture4.title![(scripture4.title!.startIndex)])
    scripture4.order = Int64(defaultScriptureDictionary["\(scripture4.book ?? "gen")"]!)
    
    let scripture5 = Scripture(context: context)
    scripture5.topic = lessonTopicsArray[0]
    scripture5.volume = "pgp"
    scripture5.book = "moses"
    scripture5.chapter = "1"
    scripture5.verse = "39"
    scripture5.title = "God's Work and Glory"
    scripture5.favorite = true
    scripture5.order = 1
    scripture5.random = Int64(arc4random_uniform(1000))
    scripture5.selected = false
    scripture5.sortingIndex = 0
    scripture5.alphabet = String(describing: scripture5.title![(scripture5.title!.startIndex)])
    scripture5.order = Int64(defaultScriptureDictionary["\(scripture5.book ?? "gen")"]!)
    
    ad.saveContext()
}
