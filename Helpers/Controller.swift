//
//  Controller.swift
//  FHE
//
//  Created by Rylan Evans on 12/5/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData

var counterArray = [Counter]()
var counter = counterArray[0]
var membersPickerArray = [Member]()
var membersArray = [Member]()
var tasksArray = [Task]()

var taskPrayer = [Task]()
var taskSong = [Task]()
var taskRule = [Task]()
var taskScripture = [Task]()
var taskCalendar = [Task]()
var taskTestimony = [Task]()
var taskSpotlight = [Task]()
var taskMisc = [Task]()
var taskThought = [Task]()
var taskLessons = [Task]()
var taskCouncil = [Task]()
var taskGame = [Task]()
var taskTreat = [Task]()

func getAttendingMembers() {
    let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
    
    let filterForAttending = NSPredicate(format: "attending == %@", NSNumber(booleanLiteral: true))
    let filterOutAutoAssigned = NSPredicate(format: "name != %@", "Auto-Assign")
    let predicateCompound = NSCompoundPredicate(type: .and, subpredicates: [filterForAttending, filterOutAutoAssigned])
    let sortByAge = NSSortDescriptor(key: "age", ascending: true)
    
    fetchRequest.predicate = predicateCompound
    fetchRequest.sortDescriptors = [sortByAge]
    
    do {
        membersArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getMembersPlusAutoAssigned() {
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

func getTasks() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "enabled == %@", NSNumber(booleanLiteral: true))
    let sortByDefaultNumber = NSSortDescriptor(key: "defaultNumber", ascending: true)
    fetchRequest.predicate = predicate
    fetchRequest.sortDescriptors = [sortByDefaultNumber]
    
    do {
        tasksArray = try context.fetch(fetchRequest)
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
        taskPrayer = try context.fetch(fetchRequest)
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
        taskSong = try context.fetch(fetchRequest)
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
        taskRule = try context.fetch(fetchRequest)
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
        taskScripture = try context.fetch(fetchRequest)
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
        taskCalendar = try context.fetch(fetchRequest)
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
        taskTestimony = try context.fetch(fetchRequest)
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
        taskSpotlight = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}


func getTaskMisc() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Misc")
    fetchRequest.predicate = predicate
    
    do {
        taskMisc = try context.fetch(fetchRequest)
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
        taskThought = try context.fetch(fetchRequest)
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
        taskLessons = try context.fetch(fetchRequest)
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
        taskCouncil = try context.fetch(fetchRequest)
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
        taskGame = try context.fetch(fetchRequest)
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
        taskTreat = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
