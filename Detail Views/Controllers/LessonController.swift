//
//  LessonController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var lessonsArray = [Lesson]()
var taskLessonsArray = [Task]()
let taskLesson = tasksAllArray[9]

func getLessons() {
    let request: NSFetchRequest<Lesson> = Lesson.fetchRequest()
    do {
        lessonsArray = try context.fetch(request)
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
