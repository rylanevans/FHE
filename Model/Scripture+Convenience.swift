//
//  Scripture+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Scripture {
    convenience init(scriptureAssignmentOrder: Int64, scriptureImage: UIImage, scriptureTheme: String, scriptureSource: String, scriptureBook: String, scriptureChapter: String, scriptureVerse: String, scriptureTitle: String, scriptureActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.scriptureAssignmentOrder = scriptureAssignmentOrder
        self.scriptureImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Scripture"))
        self.scriptureTheme = scriptureTheme
        self.scriptureTitle = scriptureTitle
        self.scriptureSource = scriptureSource
        self.scriptureBook = scriptureBook
        self.scriptureChapter = scriptureChapter
        self.scriptureVerse = scriptureVerse
        self.scriptureActive = scriptureActive
    }
}

