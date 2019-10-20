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

var counterArray = [Counter]()
var counter = counterArray[0]

// MARK: - Setting up for new users

func checkIfLauncedBefore() {
    let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
    
    if launchedBefore == true {
        print("Not first launch.")
        makeUpdatesToContent()
        getAllTasks()
        getEnabledTasks()
        addToOpenedCounter()
        getMembersAttending()
        getMembersForPicker()
        getArrayOfEnabledAndNotAssignedTasks()
        getArrayOfAttendingMembersAutoAssignOrder()
        runAssignments()
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
        getEnabledTasks()
        getMembersAttending()
        getMembersForPicker()
        getArrayOfEnabledAndNotAssignedTasks()
        getArrayOfAttendingMembersAutoAssignOrder()
        runAssignments()
        UserDefaults.standard.set(true, forKey: "launchedBefore")
    }
}

// MARK: - When opened add a new counter everytime

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
        
        if counter.launched % 52 == 0 {
            counter.tipGiven = false
            counter.feedbackGiven = false
            counter.facebookRequest = false
            ad.saveContext()
        }
        
        if counter.launched % 25 == 0 {
            counter.shared = false
            counter.seeApps = false
            ad.saveContext()
        }
        
        counter.hideFeedbackRequest = false
        counter.hideSharedRequest = false
        counter.hideAboutMe = false
        counter.hideSeeApps = false
        counter.hideFaceBookRequest = false
        ad.saveContext()
        print("\(counter.launched)")
    }
}


