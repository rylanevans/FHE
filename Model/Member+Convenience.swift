//
//  Member+Convenience.swift
//  FHE
//
//  Created by Rylan Evans on 9/23/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//


import CoreData
import UIKit

extension Member {
    convenience init(memberOrder: Int64, memberPhoto: UIImage, memberName: String, memberAge: String, memberAttending: Bool, in context:NSManagedObjectContext) {
        
        self.init(context:context)
        
        self.memberOrder = memberOrder
        self.memberPhoto = UIImagePNGRepresentation(memberPhoto)
        self.memberName = memberName
        self.memberAge = memberAge
        self.memberAttending = memberAttending
    }
}
