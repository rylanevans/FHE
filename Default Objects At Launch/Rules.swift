//
//  Rules.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData


func generateRules() {
    getAllTasks()
    let rule1 = Rule(context: context)
    rule1.title = "Media"
    rule1.detail = "“The media's the most powerful entity on earth. They have the power to make the innocent guilty and to make the guilty innocent, and that's power. Because they control the minds of the masses.”\n\n- Malcolm X"
    rule1.url = "https://drive.google.com/open?id=1U6DIUWVNML50SgX4p6mdkBrrKcXpdGIE"
    rule1.order = 1
    rule1.random = Int64(arc4random_uniform(1000))
    rule1.selected = false
    rule1.favorite = true
    rule1.sortingIndex = 0
    rule1.alphabet = String(describing: rule1.title![(rule1.title!.startIndex)])
    
    let rule2 = Rule(context: context)
    rule2.title = "Respect Others"
    rule2.detail = "We believe in the golden rule.\n“Do unto others as you would have them do unto you.”\n\n- Everyone"
    rule2.url = "https://drive.google.com/open?id=1zuUzKcEdZS7ZjZh5mKhQWWFPPw77_AaV"
    rule2.order = 2
    rule2.random = Int64(arc4random_uniform(1000))
    rule2.selected = true
    rule2.favorite = true
    rule2.sortingIndex = 0
    rule2.alphabet = String(describing: rule2.title![(rule2.title!.startIndex)])
    rule2.selectedOne = taskRule
    
    let rule3 = Rule(context: context)
    rule3.title = "Respect Belongings"
    rule3.detail = "As you get older you start to see who was raised properly. So many people lack basic respect."
    rule3.url = "https://drive.google.com/open?id=1BbDSMAKExvlt2o_NoyN81lbD4imwlW5I"
    rule3.order = 3
    rule3.random = Int64(arc4random_uniform(1000))
    rule3.selected = false
    rule3.favorite = false
    rule3.sortingIndex = 0
    rule3.alphabet = String(describing: rule3.title![(rule3.title!.startIndex)])
    
    let rule4 = Rule(context: context)
    rule4.title = "Table Manners"
    rule4.detail = "“I profoundly believe it takes a lot of ignorance to become a moral slob.”\n\n- William Buckley Jr."
    rule4.url = "https://drive.google.com/open?id=1nwcCCDRogdtmRvmdXAcfYBZFBDcaUgFt"
    rule4.order = 4
    rule4.random = Int64(arc4random_uniform(1000))
    rule4.selected = false
    rule4.favorite = false
    rule4.sortingIndex = 0
    rule4.alphabet = String(describing: rule4.title![(rule4.title!.startIndex)])
    
    let rule5 = Rule(context: context)
    rule5.title = "Morning Routine"
    rule5.detail = "Yesterday is gone. Tomorrow is a mystery. Today is a blessing!"
    rule5.url = "https://drive.google.com/open?id=1US9Zd604Ldqekde1eoQJbwQQji3LDqJM"
    rule5.order = 7
    rule5.random = Int64(arc4random_uniform(1000))
    rule5.selected = false
    rule5.favorite = false
    rule5.sortingIndex = 0
    rule5.alphabet = String(describing: rule5.title![(rule5.title!.startIndex)])
    
    let rule6 = Rule(context: context)
    rule6.title = "After School Routine"
    rule6.detail = "Never stop learning, because life never stops teaching."
    rule6.url = "https://drive.google.com/open?id=1Nb1AUCeZCMt8Em6f2LVSIzTJt776aLQl"
    rule6.order = 5
    rule6.random = Int64(arc4random_uniform(1000))
    rule6.selected = false
    rule6.favorite = false
    rule6.sortingIndex = 0
    rule6.alphabet = String(describing: rule6.title![(rule6.title!.startIndex)])
    
    let rule7 = Rule(context: context)
    rule7.title = "Bedtime Routine"
    rule7.detail = "Go to bed with dreams. Wake up with plans."
    rule7.url = "https://drive.google.com/open?id=1VhCDrnKvr_w4nv3tvZQnmXJMtAJzOphd"
    rule7.order = 6
    rule7.random = Int64(arc4random_uniform(1000))
    rule7.selected = false
    rule7.favorite = true
    rule7.sortingIndex = 0
    rule7.alphabet = String(describing: rule7.title![(rule7.title!.startIndex)])
    
    let rule8 = Rule(context: context)
    rule8.title = "House Chores"
    rule8.detail = "“May we ever choose the harder right instead of the easier wrong.”\n\n- Thomas S. Monson"
    rule8.url = "https://drive.google.com/open?id=1dkwWTrKC88OoZwZ5KOlK-b3TY63gsZDa"
    rule8.order = 8
    rule8.random = Int64(arc4random_uniform(1000))
    rule8.selected = false
    rule8.favorite = false
    rule8.sortingIndex = 0
    rule8.alphabet = String(describing: rule8.title![(rule8.title!.startIndex)])
    
    let rule9 = Rule(context: context)
    rule9.title = "FHE & HT Expectations"
    rule9.detail = "Human behavior flows from three main sources: desire (spirit), emotion (body), knowledge (mind)."
    rule9.url = "https://drive.google.com/open?id=1xJay1xQw_Yaq8mgcGPe4An-p6NC2PsQl"
    rule9.order = 9
    rule9.random = Int64(arc4random_uniform(1000))
    rule9.selected = false
    rule9.favorite = false
    rule9.sortingIndex = 0
    rule9.alphabet = String(describing: rule9.title![(rule9.title!.startIndex)])
    
    let rule10 = Rule(context: context)
    rule10.title = "Church Guidelines"
    rule10.detail = "Feed your faith and your fears will starve to death."
    rule10.url = "https://drive.google.com/open?id=11aT0cKTF2IG9DqIXEpv2m7C6suddK-zE"
    rule10.order = 10
    rule10.random = Int64(arc4random_uniform(1000))
    rule10.selected = false
    rule10.favorite = false
    rule10.sortingIndex = 0
    rule10.alphabet = String(describing: rule10.title![(rule10.title!.startIndex)])
    
    let rule11 = Rule(context: context)
    rule11.title = "Sunday Behavior"
    rule11.detail = "“Living in the moment brings you a sense of reverance for all of life's blessings.”\n\n- Oprah Winfrey"
    rule11.url = "https://drive.google.com/open?id=1BPMKRTIbwZEqgXvK9CmUMjinBgKLrV2d"
    rule11.order = 10
    rule11.random = Int64(arc4random_uniform(1000))
    rule11.selected = false
    rule11.favorite = false
    rule11.sortingIndex = 0
    rule11.alphabet = String(describing: rule11.title![(rule11.title!.startIndex)])
    
    ad.saveContext()
}
