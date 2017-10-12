//
//  FamilyMemberController.swift
//  FHE
//
//  Created by Rylan Evans on 10/11/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData

class MemberController {
    
    static let sharedMemberController = MemberController()
    
//    var mockMembers:[Member] {
//        let sampleDad = Member(memberOrder: 1, memberPhoto: #imageLiteral(resourceName: "Dad"), memberName: "Dad", memberAge: "40", memberAttending: true, in: NSManagedObjectContext)
//        let sampleMom = Member(memberOrder: 2, memberPhoto: #imageLiteral(resourceName: "Mom"), memberName: "Mom", memberAge: "35", memberAttending: true, in: NSManagedObjectContext)
//        let sampleLilly = Member(memberOrder: 3, memberPhoto: #imageLiteral(resourceName: "Lilly"), memberName: "Lilly", memberAge: "12", memberAttending: true, in: NSManagedObjectContext)
//        let sampleAnisten = Member(memberOrder: 4, memberPhoto: #imageLiteral(resourceName: "Anisten"), memberName: "Anisten", memberAge: "10", memberAttending: true, in: NSManagedObjectContext)
//        let sampleReed = Member(memberOrder: 5, memberPhoto: #imageLiteral(resourceName: "Reed"), memberName: "Reed", memberAge: "7", memberAttending: true, in: NSManagedObjectContext)
//        let sampleClaire = Member(memberOrder: 6, memberPhoto: #imageLiteral(resourceName: "Claire"), memberName: "Claire", memberAge: "5", memberAttending: true, in: NSManagedObjectContext)
//        let samplePapa = Member(memberOrder: 7, memberPhoto: #imageLiteral(resourceName: "Papa"), memberName: "Papa", memberAge: "65", memberAttending: true, in: NSManagedObjectContext)
//        let sampleGrammy = Member(memberOrder: 8, memberPhoto: #imageLiteral(resourceName: "Grammy"), memberName: "Grammy", memberAge: "60", memberAttending: true, in: NSManagedObjectContext)
//
//        return [sampleDad, sampleMom, sampleLilly, sampleAnisten, sampleReed, sampleClaire, samplePapa, sampleGrammy]
//    }
    
    let fetchedResultsController: NSFetchedResultsController<NSFetchRequestResult>
    
    init() {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Member")
        let completedSortDescriptor = NSSortDescriptor(key: "memberOrder", ascending: true)
        let dueSortDescriptor = NSSortDescriptor(key: "due", ascending: true)
        request.sortDescriptors = [completedSortDescriptor, dueSortDescriptor]
        self.fetchedResultsController = NSFetchedResultsController(fetchRequest: request, managedObjectContext: Stack.sharedStack.managedObjectContext, sectionNameKeyPath: "isComplete", cacheName: nil)
        do {
            try fetchedResultsController.performFetch()
        } catch let error as NSError {
            print("Unable to perform fetch request: \(error.localizedDescription)")
        }
    }
    
    func addTask(_ name: String, notes: String?, due: Date?) {
        let _ = Task(name: name, notes: notes, due: due)
        saveToPersistentStorage()
    }
    
    func updateTask(_ task: Task, name: String, notes: String?, due: Date?) {
        task.name = name
        task.notes = notes
        task.due = due
        saveToPersistentStorage()
    }
    
    func removeTask(_ task: Task) {
        
        task.managedObjectContext?.delete(task)
        saveToPersistentStorage()
    }
    
    func isCompleteValueToggle(_ task: Task) {
        task.isComplete = !task.isComplete.boolValue as NSNumber
        saveToPersistentStorage()
    }
    
    // MARK: - Persistence
    
    func saveToPersistentStorage() {
        
        do {
            try Stack.sharedStack.managedObjectContext.save()
        } catch {
            print("Error saving Managed Object Context. Items not saved.")
        }
    }
}
