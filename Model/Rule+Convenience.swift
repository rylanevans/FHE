//
//  Rule+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import CoreData

extension Rule {
    convenience init(ruleTitle: String, ruleDetail: String, ruleActive: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.ruleTitle = ruleTitle
        self.ruleDetail = ruleDetail
        self.ruleActive = ruleActive
    }
}
