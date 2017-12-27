//
//  GameController.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var gamesArray = [Game]()
let taskGame = tasksAllArray[11]

func getGames() {
    let request: NSFetchRequest<Game> = Game.fetchRequest()
    do {
        gamesArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
