//
//  Testimony.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func generateTestimony() {
    getAllTasks()
    let testimony = Testimony(context: context)
    testimony.selectedOne = taskTestimony
    testimony.title = "I have a testimony that..."
    testimony.detail = "1. Heavenly Father lives and loves His children. I am a child of God.\n2. Jesus Christ lives, that He is the Son of God, and that He carried out the infinite Atonement.\n3. Joseph Smith is the prophet of God who was called to restore the Gospel.\n4. The Church of Jesus Christ of Latter-day Saints is the Savior's true Church on the earth.\n5. The Church is led by a living prophet today.\n6. The Book of Mormon is another testiment of Jesus Christ.\n7. A testimony is a spiritual witness given by the Holy Ghost.\n8. A testimony grows to include all principles of the Gospel."
    testimony.selected = true
    
    ad.saveContext()
}
