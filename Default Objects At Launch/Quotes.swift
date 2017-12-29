//
//  Quotes.swift
//  FHE
//
//  Created by Rylan Evans on 12/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData


func generateQuotes() {
    getAllTasks()
    let quote1 = Quote(context: context)
    quote1.selectedOne = taskQuote
    quote1.title = "Christlike"
    quote1.detail = "“If thoughts make us who we are and we are to be like Christ then we must think Christlike thoughts.”\n\n- Ezra Taft Benson"
    quote1.url = "https://www.lds.org/ensign/1984/04/think-on-christ?lang=eng"
    quote1.order = 1
    quote1.favorite = false
    quote1.random = Int64(arc4random_uniform(1000))
    quote1.selected = true
    quote1.sortingIndex = 0
    quote1.alphabet = String(describing: quote1.title![(quote1.title!.startIndex)])
    
    let quote2 = Quote(context: context)
    quote2.title = "Faith vs. Fear"
    quote2.detail = "“Live by Faith and not by Fear.”\n\n- Quentin L. Cook"
    quote2.url = "https://www.lds.org/general-conference/2007/10/live-by-faith-and-not-by-fear?lang=eng"
    quote2.order = 2
    quote2.favorite = false
    quote2.random = Int64(arc4random_uniform(1000))
    quote2.selected = false
    quote2.sortingIndex = 0
    quote2.alphabet = String(describing: quote2.title![(quote2.title!.startIndex)])
    
    let quote3 = Quote(context: context)
    quote3.title = "A Pattern in All Things"
    quote3.detail = "“God gives us difficulties to bring out the best in us.”\n\n- Marvin J. Ashton"
    quote3.url = "https://www.lds.org/general-conference/1990/10/a-pattern-in-all-things?lang=eng"
    quote3.order = 3
    quote3.favorite = false
    quote3.random = Int64(arc4random_uniform(1000))
    quote3.selected = false
    quote3.sortingIndex = 0
    quote3.alphabet = String(describing: quote3.title![(quote3.title!.startIndex)])
    
    let quote4 = Quote(context: context)
    quote4.title = "An Attitude of Gratitude"
    quote4.detail = "“Refuse to remain in the realm of negative thought and cultivate within our hearts an attitude of gratitude.”\n\n- Thomas S. Monson"
    quote4.url = "https://www.lds.org/general-conference/1992/04/an-attitude-of-gratitude?lang=eng"
    quote4.order = 4
    quote4.favorite = true
    quote4.random = Int64(arc4random_uniform(1000))
    quote4.selected = false
    quote4.sortingIndex = 0
    quote4.alphabet = String(describing: quote4.title![(quote4.title!.startIndex)])
    
    let quote5 = Quote(context: context)
    quote5.title = "Prayer"
    quote5.detail = "“If Life Gets Too Hard To Stand, Kneel.”\n\n- Gordon B. Hinckley"
    quote5.url = "https://www.lds.org/general-conference/1996/10/women-of-the-church?lang=eng"
    quote5.order = 5
    quote5.favorite = true
    quote5.random = Int64(arc4random_uniform(1000))
    quote5.selected = false
    quote5.sortingIndex = 0
    quote5.alphabet = String(describing: quote5.title![(quote5.title!.startIndex)])
    
    let quote6 = Quote(context: context)
    quote6.title = "Live Up to Your Inheritance"
    quote6.detail = "“You have not failed until you quit trying.”\n\n- Gordon B. Hinckley"
    quote6.url = "https://www.lds.org/general-conference/1983/10/live-up-to-your-inheritance?lang=eng"
    quote6.order = 6
    quote6.favorite = false
    quote6.random = Int64(arc4random_uniform(1000))
    quote6.selected = false
    quote6.sortingIndex = 0
    quote6.alphabet = String(describing: quote6.title![(quote6.title!.startIndex)])
    
    let quote7 = Quote(context: context)
    quote7.title = "Come, Join with Us"
    quote7.detail = "“First doubt your doubts before you doubt your faith.”\n\n- Dieter F. Uchtdorf"
    quote7.url = "https://www.lds.org/general-conference/2013/10/come-join-with-us?lang=eng"
    quote7.order = 7
    quote7.favorite = true
    quote7.random = Int64(arc4random_uniform(1000))
    quote7.selected = false
    quote7.sortingIndex = 0
    quote7.alphabet = String(describing: quote7.title![(quote7.title!.startIndex)])
    
    let quote8 = Quote(context: context)
    quote8.title = "Choices"
    quote8.detail = "“May we ever choose the harder right instead of the easier wrong.”\n\n- Thomas S. Monson"
    quote8.url = "https://www.lds.org/general-conference/2016/04/choices?lang=eng"
    quote8.order = 8
    quote8.favorite = true
    quote8.random = Int64(arc4random_uniform(1000))
    quote8.selected = false
    quote8.sortingIndex = 0
    quote8.alphabet = String(describing: quote8.title![(quote8.title!.startIndex)])
    
    let quote9 = Quote(context: context)
    quote9.title = "Lest Ye Be Wearied and Faint in Your Minds"
    quote9.detail = "“Faith also includes trust in God’s timing.”\n\n- Neal A. Maxwell"
    quote9.url = "https://www.lds.org/general-conference/1991/04/lest-ye-be-wearied-and-faint-in-your-minds?lang=eng"
    quote9.order = 9
    quote9.favorite = false
    quote9.random = Int64(arc4random_uniform(1000))
    quote9.selected = false
    quote9.sortingIndex = 0
    quote9.alphabet = String(describing: quote9.title![(quote9.title!.startIndex)])
    
    let quote10 = Quote(context: context)
    quote10.title = "Your Happily Ever After"
    quote10.detail = "“You may feel that no one can understand the depth of your despair, our Savior, Jesus Christ, understands.”\n\n- Dieter F. Uchtdorf"
    quote10.url = "https://www.lds.org/general-conference/2010/04/your-happily-ever-after?lang=eng"
    quote10.order = 10
    quote10.favorite = false
    quote10.random = Int64(arc4random_uniform(1000))
    quote10.selected = false
    quote10.sortingIndex = 0
    quote10.alphabet = String(describing: quote10.title![(quote10.title!.startIndex)])
    
    let quote11 = Quote(context: context)
    quote11.title = "Within the Clasp of Your Arms"
    quote11.detail = "“Keep trying, keep reaching, keep talking, keep praying—but never give up.”\n\n- Jeffrey R. Holland"
    quote11.url = "https://www.lds.org/general-conference/1983/04/within-the-clasp-of-your-arms?lang=eng"
    quote11.order = 11
    quote11.favorite = false
    quote11.random = Int64(arc4random_uniform(1000))
    quote11.selected = false
    quote11.sortingIndex = 0
    quote11.alphabet = String(describing: quote11.title![(quote11.title!.startIndex)])
    
    let quote12 = Quote(context: context)
    quote12.title = "Lord, I Believe"
    quote12.detail = "“Lord, I believe; help thou mine unbelief.”\n\n- Elder Jeffrey R. Holland"
    quote12.url = "https://www.lds.org/general-conference/2013/04/lord-i-believe?lang=eng"
    quote12.order = 12
    quote12.favorite = true
    quote12.random = Int64(arc4random_uniform(1000))
    quote12.selected = false
    quote12.sortingIndex = 0
    quote12.alphabet = String(describing: quote12.title![(quote12.title!.startIndex)])
    
    let quote13 = Quote(context: context)
    quote13.title = "Preserving the Heart’s Mighty Change"
    quote13.detail = "“To endure to the end, we need to be eager to please God and worship Him with fervor.”\n\n- Dale G. Renlund"
    quote13.url = "https://www.lds.org/general-conference/1983/04/within-the-clasp-of-your-arms?lang=eng"
    quote13.order = 13
    quote13.favorite = false
    quote13.random = Int64(arc4random_uniform(1000))
    quote13.selected = false
    quote13.sortingIndex = 0
    quote13.alphabet = String(describing: quote13.title![(quote13.title!.startIndex)])
    
    ad.saveContext()
}
