//
//  QuoteController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var quotesArray = [Quote]()
let taskQuote = tasksAllArray[8]

func getQuotes() {
    let request: NSFetchRequest<Quote> = Quote.fetchRequest()
    do {
        quotesArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
