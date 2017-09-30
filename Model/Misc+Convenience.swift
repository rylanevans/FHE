//
//  Misc+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Misc {
    convenience init(miscImage: UIImage, miscTitle: String, miscDetail: String, miscActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.miscImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Misc"))
        self.miscTitle = miscTitle
        self.miscDetail = miscDetail
        self.miscActive = miscActive
    }
}
