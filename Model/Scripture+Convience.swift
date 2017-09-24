//
//  Scripture+Convience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Scripture {
    convenience init(scriptureTheme: String, scriptureSource: String, scriptureBook: String, scriptureChapter: String, scriptureVerse: String, scriptureTitle: String, scriptureActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.scriptureTheme = scriptureTheme
        self.scriptureTitle = scriptureTitle
        self.scriptureSource = scriptureSource
        self.scriptureBook = scriptureBook
        self.scriptureChapter = scriptureChapter
        self.scriptureVerse = scriptureVerse
        self.scriptureActive = scriptureActive
    }
}

