//
//  Member+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//


import CoreData

extension Member {
    convenience init(memberName: String, memberAge: String, memberAttending: Bool, in context:NSManagedObjectContext) {
        self.init(context:context)
        
        self.memberName = memberName
        self.memberAge = memberAge
        self.memberAttending = memberAttending
    }
}
