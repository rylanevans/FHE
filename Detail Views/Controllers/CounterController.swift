//
//  Controller.swift
//  FHE
//
//  Created by Rylan Evans on 12/5/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

// MARK: - Blank Arrays
var counterArray = [Counter]()
var counter = counterArray[0]

func checkIfLauncedBefore() {
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    
    if launchedBefore == true {
        print("Not first launch.")
        getAllTasks()
        addToOpenedCounter()
        getMembersAttending()
        getEnabledTasks()
        getTaskPrayer()
        getTaskSong()
        getTaskRule()
        getTaskScripture()
        getTaskCalendar()
        getTaskTestimony()
        getTaskSpotlight()
        getTaskThought()
        getTaskQuote()
        getTaskLessons()
        getTaskCouncil()
        getTaskGame()
        getTaskTreat()
        getSongs()
    } else {
        print("First launch, setting UserDefault.")
        beginOpenedCounter()
        generateFamilyMembers()
        generateTasks()
        generatePray()
        generateSongs()
        generateRules()
        generateScripture()
        generateCalendar()
        generateTestimony()
        generateSpotlight()
        generateThought()
        generateQuotes()
        generateLessons()
        generateCouncils()
        generateGames()
        generateTreats()
        getAllTasks()
        getMembersAttending()
        getEnabledTasks()
        getTaskPrayer()
        getTaskSong()
        getTaskRule()
        getTaskScripture()
        getTaskCalendar()
        getTaskTestimony()
        getTaskSpotlight()
        getTaskThought()
        getTaskQuote()
        getTaskLessons()
        getTaskCouncil()
        getTaskGame()
        getTaskTreat()
        getSongs()
        UserDefaults.standard.set(true, forKey: "launchedBefore")
    }
}

func addToOpenedCounter() {
    let fetchRequest: NSFetchRequest<Counter> = Counter.fetchRequest()
    
    do {
        counterArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
    
    if counter.launched > 0 {
        counter.launched += 1
        
        if counter.launched % 4 == 0 {
            counter.tipGiven = false
            ad.saveContext()
        }
        if counter.launched % 4 == 0 {
            counter.shared = false
            ad.saveContext()
        }
        if counter.launched % 4 == 0 {
            counter.feedbackGiven = false
            ad.saveContext()
        }
        
        counter.hideFeedbackRequest = false
        counter.hideSharedRequest = false
        counter.hideAboutMe = false
        ad.saveContext()
        print("\(counter.launched)")
    }
}


