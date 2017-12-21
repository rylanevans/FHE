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
var taskGamesArray = [Task]()
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

func getTaskGame() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Game")
    fetchRequest.predicate = predicate
    
    do {
        taskGamesArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}
