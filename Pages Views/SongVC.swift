//
//  SongVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices
import WebKit
import CoreData

class SongVC: UIViewController, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var songMemberPhotoImage: UIImageView!
    @IBOutlet weak var songMemberNameLabel: UILabel!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songNumberLabel: UILabel!
    
    var songURL = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        clickSoundURL()
        
        getTaskSong()
    }

    @IBAction func singSongPressed(_ sender: Any) {
        let URL = NSURL(string: "\(songURL)")!
        let songWebVC = SFSafariViewController(url: URL as URL)
        songWebVC.delegate = self
        
        present(songWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
    
    func getTaskSong() {
        var songTask = [Task]()
        var assignee = Member()
        var selected = Song()

        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let predicate = NSPredicate(format: "name == %@", "Song")
        fetchRequest.predicate = predicate
        
        do {
            songTask = try context.fetch(fetchRequest)
        } catch {
            let error = error as NSError
            print("\(error)")
        }

        let song = songTask[0]
        
        if song.assignment != nil {
            assignee = song.assignment!
        }
        
        if song.selectedSong != nil {
            selected = song.selectedSong!
        }

        songMemberNameLabel.text = assignee.name
        songMemberPhotoImage.image = assignee.photo as? UIImage
        songTitleLabel.text = selected.title
        songNumberLabel.text = "#\(selected.number)"
        songURL = selected.url ?? "https://www.lds.org/music?lang=eng"
    }
}

extension SongVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
