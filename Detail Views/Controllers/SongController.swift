//
//  SongController.swift
//  FHE
//
//  Created by Rylan Evans on 12/15/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var songsArray = [Song]()
var taskSongsArray = [Task]()
let taskSong = tasksAllArray[1]

func getSongs() {
    let request: NSFetchRequest<Song> = Song.fetchRequest()
    do {
        songsArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

func getTaskSong() {
    let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
    let predicate = NSPredicate(format: "name == %@", "Song")
    fetchRequest.predicate = predicate
    
    do {
        taskSongsArray = try context.fetch(fetchRequest)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

//func addSong(NewSong selected: Bool, favorite: Bool, alphabet: String, sortingIndex: Int64, topic: String, dateCreated: Date, random: Int64, order: Int64, number: Int64, title: String, book: String, url: String, song: Song) {
//    let _ = Song(selected: selected, favorite: favorite, alphabet: alphabet, sortingIndex: sortingIndex, topic: topic, dateCreated: dateCreated, random: random, order: order, number: number, title: title, book: book, url: url, in: <#T##NSManagedObjectContext#>)
//}

