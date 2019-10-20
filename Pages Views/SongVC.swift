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
    
    // MARK: - Custom Variables
    
    @IBOutlet weak var songMemberPhotoImage: UIImageView!
    @IBOutlet weak var songMemberNameLabel: UILabel!
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songNumberLabel: UILabel!
    
    var songURL = ""
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        offSoundURL()
        loadPageData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        runTutorial()
    }
    
    // MARK: - Tutorial Method
    
    func runTutorial() {
        if counter.songTip == false {
            counter.songTip = true
            ad.saveContext()
            let alertController = UIAlertController(title: "TIPS & TRICKS", message: "\nTIP - Turn your phone sideways to view in landscape mode.\n\nTIP - Pair your phone to your family room TV for all to see. There is suggested hardware in the “More” tab under “Tutorials” if you don't know what you would need.\n\nTRICK - Press the orange “Sing Song” button to open the link to play the song and sing-a-long with lyrics.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "✓ Got it!", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Interface Builder Methods

    @IBAction func singSongPressed(_ sender: Any) {
//        let URL = NSURL(string: "\(songURL)")!
//        let songWebVC = SFSafariViewController(url: URL as URL)
//        songWebVC.delegate = self
//
//        present(songWebVC, animated: true, completion: nil)
        
        let url = NSURL(string: "\(songURL)")
        if UIApplication.shared.canOpenURL(url! as URL) == true {
            UIApplication.shared.open(url! as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary(["":""]), completionHandler: nil)
        } else {
            let URL = NSURL(string: "https://www.churchofjesuschrist.org/music/library?lang=eng")!
            let sacriedHymnsWeb = SFSafariViewController(url: URL as URL)
            sacriedHymnsWeb.delegate = self
            
            present(sacriedHymnsWeb, animated: true, completion: nil)
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Load Content
    
    func loadPageData() {
        let specificTask = taskSong
        if let task = specificTask.selectedSong {
            let title = task.title
            let deepLinkTitle = task.title?.lowercased()
            let deepLinkTitleLowerCased = deepLinkTitle?.replacingOccurrences(of: " ", with: "-")
            let number = String(task.number)
            let book = task.book?.capitalized ?? ""
            let bookType = task.book?.lowercased()
            
//            I need to change childer's "childrens-songbook"
            
            songTitleLabel.text = title
            
            if number == "0" || number == "" {
                songNumberLabel.text = "\(book)"
            } else {
                songNumberLabel.text = "\(book)  #\(number)"
            }
            
            if task.book == nil || task.book == "" || task.title == nil || task.title == "" {
                songURL = "sacredmusic://content"
            } else {
                songURL = "sacredmusic://content/manual/\(bookType ?? "")/\(deepLinkTitleLowerCased ?? "")?lang=eng"
//                songURL = task.url!
            }
        }
        
        if let assignee = specificTask.assignment{
            songMemberPhotoImage.image = assignee.photo as? UIImage
            songMemberNameLabel.text = assignee.name
        }
    }
}

// MARK: - Extensions

extension SongVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        turnOffAudio()
        controller.dismiss(animated: true, completion: nil)
    }
}

// Used for deep links.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
