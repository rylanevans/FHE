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
