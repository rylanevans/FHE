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
    @IBOutlet weak var songThemeLabel: UILabel!
    @IBOutlet weak var songMemberPhotoImage: UIImageView!
    @IBOutlet weak var songMemberNameLabel: UILabel!
    @IBOutlet weak var songLocationLabel: UILabel!
    @IBOutlet weak var songDetailLabel: UILabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        clickSoundURL()
        
        getTaskSong()
    }

    @IBAction func singSongPressed(_ sender: Any) {
//        playClick()
        let URL = NSURL(string: "https://www.lds.org/music/library/childrens-songbook/i-lived-in-heaven?lang=eng")!
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
        assignee = song.assignment!
        songMemberNameLabel.text = assignee.name
        songMemberPhotoImage.image = assignee.photo as? UIImage
    }
}

extension SongVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
