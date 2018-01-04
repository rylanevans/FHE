//
//  SpotlightVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class SpotlightVC: UIViewController {
    @IBOutlet weak var spotlightMemberPhotoImage: UIImageView!
    @IBOutlet weak var spotlightMemberNameLabel: UILabel!
    @IBOutlet weak var spotlightTitleLabel: UILabel!
    @IBOutlet weak var spotlightDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        runTutorial()
    }
    
    func runTutorial() {
        if counter.launched < 3 && counter.launched % 2 != 0 {
            let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - Spotlight is designed to be opposite of the other tasks. Instead of the assignee leading, they stand in the spotlight while everyone else takes turns and gives that person meaningful compliments.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskSpotlight
        if let task = specificTask.selectedSpotlight {
            spotlightTitleLabel.text = task.title
            spotlightDetailLabel.text = task.detail
        }
        
        if let assignee = specificTask.assignment {
            spotlightMemberPhotoImage.image = assignee.photo as? UIImage
            spotlightMemberNameLabel.text = assignee.name
        }
    }
}
