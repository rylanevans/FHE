//
//  Updates.swift
//  FHE
//
//  Created by Rylan Evans on 3/2/18.
//  Copyright © 2018 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func makeUpdatesToContent() {
    let updatedVOnePointTwo = UserDefaults.standard.bool(forKey: "updatedVOnePointTwo")
    
    if updatedVOnePointTwo == false {
        print("Updating")
        getLessonToDeleteTheAngerEatingMonster()
        getLessonToDeleteInspirationFromPrinceEA()
        addNewContent()
        UserDefaults.standard.set(true, forKey: "updatedVOnePointTwo")
    } else {
        print("Already updated")
    }
}

// Add

func addNewContent() {
    let quote16 = Quote(context: context)
    quote16.title = "The Living Christ"
    quote16.detail = "“The Testimony of the Apostles”\n\n- The Church of Jesus Christ of Latter Day Saints"
    quote16.url = "https://www.lds.org/bc/content/shared/content/images/magazines/ensign/2017/05/living-christ-testimony-apostles_1916605.pdf"
    quote16.order = 15
    quote16.favorite = true
    quote16.random = Int64(arc4random_uniform(1000))
    quote16.selected = false
    quote16.sortingIndex = 0
    quote16.alphabet = String(describing: quote16.title![(quote16.title!.startIndex)])
    
    let quote17 = Quote(context: context)
    quote17.title = "The Family"
    quote17.detail = "“A Proclamation to the World”\n\n- The Church of Jesus Christ of Latter Day Saints"
    quote17.url = "https://www.lds.org/bc/content/shared/content/images/gospel-library/manual/34190/34190_000_WWC_26-FamProc.pdf"
    quote17.order = 15
    quote17.favorite = true
    quote17.random = Int64(arc4random_uniform(1000))
    quote17.selected = false
    quote17.sortingIndex = 0
    quote17.alphabet = String(describing: quote17.title![(quote17.title!.startIndex)])
    
    let lesson70 = Lesson(context: context)
    lesson70.category = "Spiritual"
    lesson70.topic = "Atonement"
    lesson70.title = "A New Life"
    lesson70.detail = "My belief in Jesus Christ has given me a new life. The life that is full of happiness, the life that is full of miracles, the life that is full of blessings."
    lesson70.url = "https://www.youtube.com/watch?v=tRSZBINJ0eA"
    lesson70.youTubeVideo = true
    lesson70.order = 9
    lesson70.favorite = false
    lesson70.random = Int64(arc4random_uniform(1000))
    lesson70.selected = false
    lesson70.sortingIndex = 0
    lesson70.alphabet = String(describing: lesson70.title![(lesson70.title!.startIndex)])
    
    ad.saveContext()
}

// Delete

func getLessonToDeleteTheAngerEatingMonster() {
    let fetchRequest: NSFetchRequest<Lesson> = Lesson.fetchRequest()
    
    let filterForSelected = NSPredicate(format: "selected == %@", NSNumber(booleanLiteral: false))
    let filterForTitleOfLesson = NSPredicate(format: "title == %@", "The Anger Eating Monster")
    let predicateCompound = NSCompoundPredicate(type: .and, subpredicates: [filterForSelected, filterForTitleOfLesson])
    
    fetchRequest.predicate = predicateCompound
    
    var results = [Lesson]()
    
    do {
        results = try context.fetch(fetchRequest)
            for result in results as [NSManagedObject] {
                context.delete(result)
        }
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getLessonToDeleteInspirationFromPrinceEA() {
    let fetchRequest: NSFetchRequest<Lesson> = Lesson.fetchRequest()
    
    let filterForSelected = NSPredicate(format: "selected == %@", NSNumber(booleanLiteral: false))
    let filterForTitleOfLesson = NSPredicate(format: "detail == %@", "Inspiration from Prince EA.")
    let predicateCompound = NSCompoundPredicate(type: .and, subpredicates: [filterForSelected, filterForTitleOfLesson])
    
    fetchRequest.predicate = predicateCompound
    
    var results = [Lesson]()
    
    do {
        results = try context.fetch(fetchRequest)
        for result in results as [NSManagedObject] {
            context.delete(result)
        }
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}





// Update
//let lesson33 = Lesson(context: context)
//lesson33.category = "Temporal"
//lesson33.topic = "Intellectual"
//lesson33.title = "What the Internet is Doing to Our Brains ----Internet vs. our Brains"
//lesson33.detail = "Most of us are on the Internet on a daily basis and whether we like it or not, the Internet is affecting us. It changes how we think, how we work, and it even changes our brains."
//lesson33.url = "https://www.youtube.com/watch?v=cKaWJ72x1rI"
//lesson33.youTubeVideo = true
//lesson33.order = 9
//lesson33.favorite = false
//lesson33.random = Int64(arc4random_uniform(1000))
//lesson33.selected = false
//lesson33.sortingIndex = 0
//lesson33.alphabet = String(describing: lesson33.title![(lesson33.title!.startIndex)])

//let lesson64 = Lesson(context: context)
//lesson64.category = "Temporal"
//lesson64.topic = "Spiritual"
//lesson64.title = "Does Science Argue for or against God? ---Science and God?"
//lesson64.detail = "Why are we here? Literally. The latest science says we shouldn’t be."
//lesson64.url = "https://www.youtube.com/watch?v=UjGPHF5A6Po"
//lesson64.youTubeVideo = true
//lesson64.order = 9
//lesson64.favorite = false
//lesson64.random = Int64(arc4random_uniform(1000))
//lesson64.selected = false
//lesson64.sortingIndex = 0
//lesson64.alphabet = String(describing: lesson64.title![(lesson64.title!.startIndex)])


