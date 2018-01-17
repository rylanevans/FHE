//
//  Tasks.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func generateTasks() {
    getMembersAttending()
    let taskOpenPrayer = Task(context: context)
    taskOpenPrayer.assigned = false
    taskOpenPrayer.defaultNumber = 1
    taskOpenPrayer.enabled = true
    taskOpenPrayer.name = "Opening Prayer"
    taskOpenPrayer.order = Int64(arc4random_uniform(100))
    taskOpenPrayer.segment = 0
    taskOpenPrayer.image = #imageLiteral(resourceName: "Prayer")
    
    let taskSongs = Task(context: context)
    taskSongs.assigned = false
    taskSongs.defaultNumber = 2
    taskSongs.enabled = true
    taskSongs.name = "Song"
    taskSongs.order = Int64(arc4random_uniform(100))
    taskSongs.segment = 0
    taskSongs.image = #imageLiteral(resourceName: "Song")
    
    let taskRule = Task(context: context)
    taskRule.assigned = false
    taskRule.defaultNumber = 3
    taskRule.enabled = true
    taskRule.name = "Rule"
    taskRule.order = Int64(arc4random_uniform(100))
    taskRule.segment = 0
    taskRule.image = #imageLiteral(resourceName: "Rule")
    
    let taskScripture = Task(context: context)
    taskScripture.assigned = false
    taskScripture.defaultNumber = 4
    taskScripture.enabled = true
    taskScripture.name = "Scripture"
    taskScripture.order = Int64(arc4random_uniform(100))
    taskScripture.segment = 0
    taskScripture.image = #imageLiteral(resourceName: "Scripture")
    
    let taskCalendar = Task(context: context)
    taskCalendar.assigned = false
    taskCalendar.defaultNumber = 5
    taskCalendar.enabled = true
    taskCalendar.name = "Calendar"
    taskCalendar.order = Int64(arc4random_uniform(100))
    taskCalendar.segment = 0
    taskCalendar.image = #imageLiteral(resourceName: "Calendar")
    
    let taskTestimony = Task(context: context)
    taskTestimony.assigned = false
    taskTestimony.defaultNumber = 6
    taskTestimony.enabled = true
    taskTestimony.name = "Testimony"
    taskTestimony.order = Int64(arc4random_uniform(100))
    taskTestimony.segment = 0
    taskTestimony.image = #imageLiteral(resourceName: "Favorite")
    
    let taskSpotlight = Task(context: context)
    taskSpotlight.assigned = false
    taskSpotlight.defaultNumber = 7
    taskSpotlight.enabled = true
    taskSpotlight.name = "Spotlight"
    taskSpotlight.order = Int64(arc4random_uniform(100))
    taskSpotlight.segment = 0
    taskSpotlight.image = #imageLiteral(resourceName: "Spotlight")
    
    let taskThought = Task(context: context)
    taskThought.assigned = false
    taskThought.defaultNumber = 8
    taskThought.enabled = true
    taskThought.name = "Thought"
    taskThought.order = Int64(arc4random_uniform(100))
    taskThought.segment = 0
    taskThought.image = #imageLiteral(resourceName: "Thought")
    
    let taskQuote = Task(context: context)
    taskQuote.assigned = false
    taskQuote.defaultNumber = 9
    taskQuote.enabled = true
    taskQuote.name = "Quote"
    taskQuote.order = Int64(arc4random_uniform(100))
    taskQuote.segment = 0
    taskQuote.image = #imageLiteral(resourceName: "Quote")
    
    let taskLesson = Task(context: context)
    taskLesson.assigned = false
    taskLesson.defaultNumber = 10
    taskLesson.enabled = true
    taskLesson.name = "Lesson"
    taskLesson.order = Int64(arc4random_uniform(100))
    taskLesson.segment = 0
    taskLesson.image = #imageLiteral(resourceName: "Lesson")
    
    let taskCouncil = Task(context: context)
    taskCouncil.assigned = false
    taskCouncil.defaultNumber = 11
    taskCouncil.enabled = true
    taskCouncil.name = "Council"
    taskCouncil.order = Int64(arc4random_uniform(100))
    taskCouncil.segment = 0
    taskCouncil.image = #imageLiteral(resourceName: "Council")
    
    let taskGame = Task(context: context)
    taskGame.assigned = false
    taskGame.defaultNumber = 12
    taskGame.enabled = true
    taskGame.name = "Activity"
    taskGame.order = Int64(arc4random_uniform(100))
    taskGame.segment = 0
    taskGame.image = #imageLiteral(resourceName: "Game")
    
    let taskClosePrayer = Task(context: context)
    taskClosePrayer.assigned = false
    taskClosePrayer.defaultNumber = 13
    taskClosePrayer.enabled = true
    taskClosePrayer.name = "Closing Prayer"
    taskClosePrayer.order = Int64(arc4random_uniform(100))
    taskClosePrayer.segment = 0
    taskClosePrayer.image = #imageLiteral(resourceName: "Prayer")
    
    let taskTreat = Task(context: context)
    taskTreat.assigned = false
    taskTreat.defaultNumber = 14
    taskTreat.enabled = true
    taskTreat.name = "Treat"
    taskTreat.order = Int64(arc4random_uniform(100))
    taskTreat.segment = 0
    taskTreat.image = #imageLiteral(resourceName: "Treat")
    
    ad.saveContext()
}
