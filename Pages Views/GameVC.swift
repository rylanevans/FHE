//
//  GameVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class GameVC: UIViewController {
    @IBOutlet weak var gameMemberPhotoImage: UIImageView!
    @IBOutlet weak var gameMemberNameLabel: UILabel!
    @IBOutlet weak var gameTitleLabel: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    @IBOutlet weak var gameCategoryLabel: UILabel!
    
    var gameURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "\(gameURL)")!
        let gameWebVC = SFSafariViewController(url: URL as URL)
        gameWebVC.delegate = self
        
        present(gameWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskGame
        if let task = specificTask.selectedGame {
            gameTitleLabel.text = task.title
            gameCategoryLabel.text = task.category
            gameURL = task.url ?? "https://www.wikihow.com/Main-Page"
        }
        
        if let assignee = specificTask.assignment {
            gameMemberPhotoImage.image = assignee.photo as? UIImage
            gameMemberNameLabel.text = assignee.name
        }
    }
}

extension GameVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
