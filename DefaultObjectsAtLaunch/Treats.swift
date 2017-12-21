//
//  Treats.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func generateTreats() {
    getAllTasks()
    let treat1 = Treat(context: context)
    treat1.category = treatsCategoryArray[0]
    treat1.title = "Surprise!"
    treat1.url = "https://drive.google.com/open?id=1vdnjN6aNW4iRC1ljf79MBELI2-eW0BHe"
    treat1.favorite = true
    treat1.order = 1
    treat1.random = Int64(arc4random_uniform(1000))
    treat1.selected = false
    treat1.sortingIndex = 0
    
    let treat2 = Treat(context: context)
    treat2.category = treatsCategoryArray[1]
    treat2.selectedOne = taskTreat
    treat2.title = "Chocolate Chip Cookies"
    treat2.url = "https://pin.it/digy53rpktcbza"
    treat2.favorite = true
    treat2.order = 2
    treat2.random = Int64(arc4random_uniform(1000))
    treat2.selected = true
    treat2.sortingIndex = 0
    
    let treat3 = Treat(context: context)
    treat3.category = treatsCategoryArray[0]
    treat3.title = "S'mores"
    treat3.url = "https://pin.it/k2wn4tvrckyfh4"
    treat3.favorite = true
    treat3.order = 3
    treat3.random = Int64(arc4random_uniform(1000))
    treat3.selected = false
    treat3.sortingIndex = 0
    
    let treat4 = Treat(context: context)
    treat4.category = treatsCategoryArray[2]
    treat4.title = "Brownies"
    treat4.url = "https://pin.it/lrk44ktgy5juab"
    treat4.favorite = true
    treat4.order = 4
    treat4.random = Int64(arc4random_uniform(1000))
    treat4.selected = false
    treat4.sortingIndex = 0
    
    let treat5 = Treat(context: context)
    treat5.category = treatsCategoryArray[3]
    treat5.title = "Chocolate Cake"
    treat5.url = "https://pin.it/flg2akxci43cu3"
    treat5.favorite = false
    treat5.order = 5
    treat5.random = Int64(arc4random_uniform(1000))
    treat5.selected = false
    treat5.sortingIndex = 0
    
    let treat6 = Treat(context: context)
    treat6.category = treatsCategoryArray[3]
    treat6.title = "Cookies & Cream Cupcakes"
    treat6.url = "https://pin.it/g2rouxg72kxakd"
    treat6.favorite = false
    treat6.order = 6
    treat6.random = Int64(arc4random_uniform(1000))
    treat6.selected = false
    treat6.sortingIndex = 0
    
    let treat7 = Treat(context: context)
    treat7.category = treatsCategoryArray[4]
    treat7.title = "Apple Pie"
    treat7.url = "https://pin.it/h3tqjhnddu2zfx"
    treat7.favorite = false
    treat7.order = 7
    treat7.random = Int64(arc4random_uniform(1000))
    treat7.selected = false
    treat7.sortingIndex = 0
    
    let treat8 = Treat(context: context)
    treat8.category = treatsCategoryArray[5]
    treat8.title = "Strawberry Ice Cream"
    treat8.url = "https://pin.it/4j3vfkisqwevkh"
    treat8.favorite = false
    treat8.order = 8
    treat8.random = Int64(arc4random_uniform(1000))
    treat8.selected = false
    treat8.sortingIndex = 0
    
    let treat9 = Treat(context: context)
    treat9.category = treatsCategoryArray[6]
    treat9.title = "Strawberry Coconut Shake"
    treat9.url = "https://pin.it/gn5hg2zde2cws5"
    treat9.favorite = false
    treat9.order = 9
    treat9.random = Int64(arc4random_uniform(1000))
    treat9.selected = false
    treat9.sortingIndex = 0
    
    let treat10 = Treat(context: context)
    treat10.category = treatsCategoryArray[7]
    treat10.title = "Popsicles"
    treat10.url = "https://pin.it/52rngnfkjyh56l"
    treat10.favorite = false
    treat10.order = 10
    treat10.random = Int64(arc4random_uniform(1000))
    treat10.selected = false
    treat10.sortingIndex = 0
    
    let treat11 = Treat(context: context)
    treat11.category = treatsCategoryArray[8]
    treat11.title = "Chocolate Pudding"
    treat11.url = "https://pin.it/ohboixv2afu3xf"
    treat11.favorite = false
    treat11.order = 11
    treat11.random = Int64(arc4random_uniform(1000))
    treat11.selected = false
    treat11.sortingIndex = 0
    
    let treat12 = Treat(context: context)
    treat12.category = treatsCategoryArray[9]
    treat12.title = "Butterfinders"
    treat12.url = "https://pin.it/3ikto7zqomaxtl"
    treat12.favorite = false
    treat12.order = 12
    treat12.random = Int64(arc4random_uniform(1000))
    treat12.selected = false
    treat12.sortingIndex = 0
    
    let treat13 = Treat(context: context)
    treat13.category = treatsCategoryArray[10]
    treat13.title = "Popcorn"
    treat13.url = "https://pin.it/ucx26xitl5tpvt"
    treat13.favorite = true
    treat13.order = 13
    treat13.random = Int64(arc4random_uniform(1000))
    treat13.selected = false
    treat13.sortingIndex = 0
    
    ad.saveContext()
}
