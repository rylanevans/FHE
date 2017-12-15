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

func getSongs() {
    let request: NSFetchRequest<Song> = Song.fetchRequest()
    do {
        songsArray = try context.fetch(request)
    } catch {
        let error = error as NSError
        print("\(error)")
    }
}

