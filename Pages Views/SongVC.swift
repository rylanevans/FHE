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
        
        offSoundURL()
        
        loadPageData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        runTutorial()
    }
    
    func runTutorial() {
        if counter.songTip == false {
            counter.songTip = true
            ad.saveContext()
            let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTRICK - Press any of the orange “Sing Song” or “Details” buttons in the center bottom of the screen to open the link for more info. For the song, press it to sing-a-long with the music and lyrics. Make sure to press “▶️” (play) button on the web page to hear the music.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
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
    
    func loadPageData() {
        let specificTask = taskSong
        if let task = specificTask.selectedSong {
            songTitleLabel.text = task.title
            songNumberLabel.text = "#\(task.number)"
            songURL = task.url ?? "https://www.lds.org/music/library?lang=eng"
        }
        
        if let assignee = specificTask.assignment{
            songMemberPhotoImage.image = assignee.photo as? UIImage
            songMemberNameLabel.text = assignee.name
        }
    }
}

extension SongVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        turnOffAudio()
        controller.dismiss(animated: true, completion: nil)
    }
}
