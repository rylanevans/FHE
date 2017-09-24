//
//  Lesson+Convience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Lesson {
    convenience init(lessonTheme: String, lessonTitle: String, lessonDetail: String, lessonURL: String, lessonActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.lessonTheme = lessonTheme
        self.lessonTitle = lessonTitle
        self.lessonDetail = lessonDetail
        self.lessonURL = lessonURL
        self.lessonActive = lessonActive
    }
}
