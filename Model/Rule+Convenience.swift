//
//  Rule+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData
import UIKit

extension Rule {
    convenience init(ruleImage: UIImage, ruleTitle: String, ruleDetail: String, ruleActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.ruleImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Rule"))
        self.ruleTitle = ruleTitle
        self.ruleDetail = ruleDetail
        self.ruleActive = ruleActive
    }
}
