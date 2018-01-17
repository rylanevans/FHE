//
//  MemberController.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var membersAllArray = [Member]()
var membersPickerArray = [Member]()
var membersAttendingArray = [Member]()
var arrayOfAttendingMembersAutoAssignOrder = [Member]()

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

func getArrayOfAttendingMembersAutoAssignOrder() {
    let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
    
    let filterByAttending = NSPredicate(format: "attending == %@", NSNumber(booleanLiteral: true))
    let filterOutAutoAssigned = NSPredicate(format: "name != %@", "Auto-Assign")
    let sortByAutoAssignOrder = NSSortDescriptor(key: "order", ascending: true)
    let predicateCompound = NSCompoundPredicate(type: .and, subpredicates: [filterByAttending, filterOutAutoAssigned])
    
    fetchRequest.predicate = predicateCompound
    fetchRequest.sortDescriptors = [sortByAutoAssignOrder]
    
    do {
        arrayOfAttendingMembersAutoAssignOrder = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
