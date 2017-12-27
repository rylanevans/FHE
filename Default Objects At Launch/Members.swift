//
//  Members.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func generateFamilyMembers() {
    let memberAuto = Member(context: context)
    memberAuto.name = "Auto-Assign"
    memberAuto.age = 0
    memberAuto.attending = true
    memberAuto.order = 0
    memberAuto.photo = #imageLiteral(resourceName: "Missing Profile") as UIImage
    memberAuto.random = Int64(arc4random_uniform(100))
    
    let memberDad = Member(context: context)
    memberDad.name = "Dad"
    memberDad.age = 38
    memberDad.attending = true
    memberDad.order = 1
    memberDad.photo = #imageLiteral(resourceName: "Dad") as UIImage
    memberDad.random = Int64(arc4random_uniform(100))
    
    let memberMom = Member(context: context)
    memberMom.name = "Mom"
    memberMom.age = 36
    memberMom.attending = true
    memberMom.order = 2
    memberMom.photo = #imageLiteral(resourceName: "Mom") as UIImage
    memberMom.random = Int64(arc4random_uniform(100))
    
    let memberLilly = Member(context: context)
    memberLilly.name = "Lilly"
    memberLilly.age = 12
    memberLilly.attending = true
    memberLilly.order = 3
    memberLilly.photo = #imageLiteral(resourceName: "Lilly") as UIImage
    memberLilly.random = Int64(arc4random_uniform(100))
    
    let memberAnisten = Member(context: context)
    memberAnisten.name = "Anisten"
    memberAnisten.age = 10
    memberAnisten.attending = true
    memberAnisten.order = 4
    memberAnisten.photo = #imageLiteral(resourceName: "Anisten") as UIImage
    memberAnisten.random = Int64(arc4random_uniform(100))
    
    let memberReed = Member(context: context)
    memberReed.name = "Reed"
    memberReed.age = 8
    memberReed.attending = true
    memberReed.order = 5
    memberReed.photo = #imageLiteral(resourceName: "Reed") as UIImage
    memberReed.random = Int64(arc4random_uniform(100))
    
    let memberClaire = Member(context: context)
    memberClaire.name = "Claire"
    memberClaire.age = 5
    memberClaire.attending = true
    memberClaire.order = 6
    memberClaire.photo = #imageLiteral(resourceName: "Claire") as UIImage
    memberClaire.random = Int64(arc4random_uniform(100))
    
    let memberPapa = Member(context: context)
    memberPapa.name = "Papa"
    memberPapa.age = 60
    memberPapa.attending = false
    memberPapa.order = 7
    memberPapa.photo = #imageLiteral(resourceName: "Papa") as UIImage
    memberPapa.random = Int64(arc4random_uniform(100))
    
    let memberGrammy = Member(context: context)
    memberGrammy.name = "Grammy"
    memberGrammy.age = 55
    memberGrammy.attending = false
    memberGrammy.order = 8
    memberGrammy.photo = #imageLiteral(resourceName: "Grammy") as UIImage
    memberGrammy.random = Int64(arc4random_uniform(100))
    
    let memberGuest = Member(context: context)
    memberGuest.name = "Guest"
    memberGuest.age = 100
    memberGuest.attending = false
    memberGuest.order = 9
    memberGuest.photo = #imageLiteral(resourceName: "Missing Profile") as UIImage
    memberGuest.random = Int64(arc4random_uniform(100))
    
    ad.saveContext()
}
