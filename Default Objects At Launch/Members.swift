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
    
    let memberLilly = Member(context: context)
    memberLilly.name = "Dad"
    memberLilly.age = 30
    memberLilly.attending = true
    memberLilly.order = 1
    memberLilly.photo = #imageLiteral(resourceName: "Dad") as UIImage
    memberLilly.random = Int64(arc4random_uniform(100))
    
    let memberAnisten = Member(context: context)
    memberAnisten.name = "Mom"
    memberAnisten.age = 25
    memberAnisten.attending = true
    memberAnisten.order = 2
    memberAnisten.photo = #imageLiteral(resourceName: "Mom") as UIImage
    memberAnisten.random = Int64(arc4random_uniform(100))
    
    let memberReed = Member(context: context)
    memberReed.name = "Son"
    memberReed.age = 8
    memberReed.attending = true
    memberReed.order = 3
    memberReed.photo = #imageLiteral(resourceName: "Reed") as UIImage
    memberReed.random = Int64(arc4random_uniform(100))
    
    let memberClaire = Member(context: context)
    memberClaire.name = "Daughter"
    memberClaire.age = 5
    memberClaire.attending = true
    memberClaire.order = 4
    memberClaire.photo = #imageLiteral(resourceName: "Claire") as UIImage
    memberClaire.random = Int64(arc4random_uniform(100))
    
    let memberPapa = Member(context: context)
    memberPapa.name = "Grandpa"
    memberPapa.age = 50
    memberPapa.attending = false
    memberPapa.order = 5
    memberPapa.photo = #imageLiteral(resourceName: "Grandpa") as UIImage
    memberPapa.random = Int64(arc4random_uniform(100))
    
    let memberGrammy = Member(context: context)
    memberGrammy.name = "Grandma"
    memberGrammy.age = 45
    memberGrammy.attending = false
    memberGrammy.order = 6
    memberGrammy.photo = #imageLiteral(resourceName: "Grandma") as UIImage
    memberGrammy.random = Int64(arc4random_uniform(100))
    
    let memberGuest1 = Member(context: context)
    memberGuest1.name = "Guest 1"
    memberGuest1.age = 100
    memberGuest1.attending = false
    memberGuest1.order = 7
    memberGuest1.photo = #imageLiteral(resourceName: "Missing Profile") as UIImage
    memberGuest1.random = Int64(arc4random_uniform(100))
    
    let memberGuest2 = Member(context: context)
    memberGuest2.name = "Guest 2"
    memberGuest2.age = 100
    memberGuest2.attending = false
    memberGuest2.order = 8
    memberGuest2.photo = #imageLiteral(resourceName: "Missing Profile") as UIImage
    memberGuest2.random = Int64(arc4random_uniform(100))
    
//    let memberDad = Member(context: context)
//    memberDad.name = "Dad"
//    memberDad.age = 38
//    memberDad.attending = true
//    memberDad.order = 1
//    memberDad.photo = #imageLiteral(resourceName: "Dad") as UIImage
//    memberDad.random = Int64(arc4random_uniform(100))
//
//    let memberMom = Member(context: context)
//    memberMom.name = "Mom"
//    memberMom.age = 36
//    memberMom.attending = true
//    memberMom.order = 2
//    memberMom.photo = #imageLiteral(resourceName: "Mom") as UIImage
//    memberMom.random = Int64(arc4random_uniform(100))
//
//    let memberLilly = Member(context: context)
//    memberLilly.name = "Lilly"
//    memberLilly.age = 12
//    memberLilly.attending = true
//    memberLilly.order = 3
//    memberLilly.photo = #imageLiteral(resourceName: "Lilly") as UIImage
//    memberLilly.random = Int64(arc4random_uniform(100))
//
//    let memberAnisten = Member(context: context)
//    memberAnisten.name = "Anisten"
//    memberAnisten.age = 10
//    memberAnisten.attending = true
//    memberAnisten.order = 4
//    memberAnisten.photo = #imageLiteral(resourceName: "Anisten") as UIImage
//    memberAnisten.random = Int64(arc4random_uniform(100))
//
//    let memberReed = Member(context: context)
//    memberReed.name = "Reed"
//    memberReed.age = 8
//    memberReed.attending = true
//    memberReed.order = 5
//    memberReed.photo = #imageLiteral(resourceName: "Reed") as UIImage
//    memberReed.random = Int64(arc4random_uniform(100))
//
//    let memberClaire = Member(context: context)
//    memberClaire.name = "Claire"
//    memberClaire.age = 5
//    memberClaire.attending = true
//    memberClaire.order = 6
//    memberClaire.photo = #imageLiteral(resourceName: "Claire") as UIImage
//    memberClaire.random = Int64(arc4random_uniform(100))
//
//    let memberPapa = Member(context: context)
//    memberPapa.name = "Papa"
//    memberPapa.age = 60
//    memberPapa.attending = false
//    memberPapa.order = 7
//    memberPapa.photo = #imageLiteral(resourceName: "Papa") as UIImage
//    memberPapa.random = Int64(arc4random_uniform(100))
//
//    let memberGrammy = Member(context: context)
//    memberGrammy.name = "Grammy"
//    memberGrammy.age = 55
//    memberGrammy.attending = false
//    memberGrammy.order = 8
//    memberGrammy.photo = #imageLiteral(resourceName: "Grammy") as UIImage
//    memberGrammy.random = Int64(arc4random_uniform(100))
//
//    let memberGuest = Member(context: context)
//    memberGuest.name = "Guest"
//    memberGuest.age = 100
//    memberGuest.attending = false
//    memberGuest.order = 9
//    memberGuest.photo = #imageLiteral(resourceName: "Missing Profile") as UIImage
//    memberGuest.random = Int64(arc4random_uniform(100))
    
    ad.saveContext()
}
