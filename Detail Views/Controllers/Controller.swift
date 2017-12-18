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

// MARK: - Selected Tasks & Counter
let taskPrayer = tasksAllArray[0]
let taskSong = tasksAllArray[1]
let taskRule = tasksAllArray[2]
let taskScripture = tasksAllArray[3]
let taskCalendar = tasksAllArray[4]
let taskTestimony = tasksAllArray[5]
let taskSpotlight = tasksAllArray[6]
let taskThought = tasksAllArray[7]
let taskQuote = tasksAllArray[8]
let taskLesson = tasksAllArray[9]
let taskCouncil = tasksAllArray[10]
let taskGame = tasksAllArray[11]
let taskTreat = tasksAllArray[12]
var counter = counterArray[0]

// MARK: - Blank Arrays
var counterArray = [Counter]()
var membersAllArray = [Member]()
var membersPickerArray = [Member]()
var membersAttendingArray = [Member]()
var tasksAllArray = [Task]()
var tasksEnabledArray = [Task]()

var taskPrayersArray = [Task]()
var taskSongsArray = [Task]()
var taskRulesArray = [Task]()
var taskScripturesArray = [Task]()
var taskCalendarArray = [Task]()
var taskTestimonyArray = [Task]()
var taskSpotlightArray = [Task]()
var taskThoughtArray = [Task]()
var taskQuotesArray = [Task]()
var taskLessonsArray = [Task]()
var taskCouncilArray = [Task]()
var taskGamesArray = [Task]()
var taskTreatsArray = [Task]()
//var scrollPageArray = [UIViewController]()

func getMembersAttending() {
    let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
    
    let filterForAttending = NSPredicate(format: "attending == %@", NSNumber(booleanLiteral: true))
    let filterOutAutoAssigned = NSPredicate(format: "name != %@", "Auto-Assign")
    let predicateCompound = NSCompoundPredicate(type: .and, subpredicates: [filterForAttending, filterOutAutoAssigned])
    let sortByAge = NSSortDescriptor(key: "age", ascending: true)
    
    fetchRequest.predicate = predicateCompound
    fetchRequest.sortDescriptors = [sortByAge]
    
    do {
        membersAttendingArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getMembersForPicker() {
    let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
    
    let filterForAttending = NSPredicate(format: "attending == %@", NSNumber(booleanLiteral: true))
    let sortByAge = NSSortDescriptor(key: "age", ascending: true)
    
    fetchRequest.predicate = filterForAttending
    fetchRequest.sortDescriptors = [sortByAge]
    
    do {
        membersPickerArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getAllMembers() {
    let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
    
    let sortByAge = NSSortDescriptor(key: "age", ascending: true)
    
    fetchRequest.sortDescriptors = [sortByAge]
    
    do {
        membersAllArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getAllTasks() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let sortByDefaultNumber = NSSortDescriptor(key: "defaultNumber", ascending: true)
    fetchRequest.sortDescriptors = [sortByDefaultNumber]
    
    do {
        tasksAllArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getEnabledTasks() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "enabled == %@", NSNumber(booleanLiteral: true))
    let sortByDefaultNumber = NSSortDescriptor(key: "defaultNumber", ascending: true)
    fetchRequest.predicate = predicate
    fetchRequest.sortDescriptors = [sortByDefaultNumber]
    
    do {
        tasksEnabledArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskPrayer() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Prayer")
    fetchRequest.predicate = predicate
    
    do {
        taskPrayersArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskSong() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Song")
    fetchRequest.predicate = predicate
    
    do {
        taskSongsArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskRule() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Rule")
    fetchRequest.predicate = predicate
    
    do {
        taskRulesArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskScripture() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Scripture")
    fetchRequest.predicate = predicate
    
    do {
        taskScripturesArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskCalendar() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Calendar")
    fetchRequest.predicate = predicate
    
    do {
        taskCalendarArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskTestimony() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Testimony")
    fetchRequest.predicate = predicate
    
    do {
        taskTestimonyArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskSpotlight() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Spotlight")
    fetchRequest.predicate = predicate
    
    do {
        taskSpotlightArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskThought() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Thought")
    fetchRequest.predicate = predicate
    
    do {
        taskThoughtArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskQuote() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Quote")
    fetchRequest.predicate = predicate
    
    do {
        taskQuotesArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskLessons() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Lessons")
    fetchRequest.predicate = predicate
    
    do {
        taskLessonsArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskCouncil() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Council")
    fetchRequest.predicate = predicate
    
    do {
        taskCouncilArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskGame() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Game")
    fetchRequest.predicate = predicate
    
    do {
        taskGamesArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskTreat() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Treat")
    fetchRequest.predicate = predicate
    
    do {
        taskTreatsArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}



