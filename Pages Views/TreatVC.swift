//
//  TreatVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices

class TreatVC: UIViewController {
    @IBOutlet weak var treatMemberPhotoImage: UIImageView!
    @IBOutlet weak var treatMemberNameLabel: UILabel!
    @IBOutlet weak var treatTitleLabel: UILabel!
    @IBOutlet weak var treatImage: UIImageView!
    @IBOutlet weak var treatCategoryLabel: UILabel!
    
    var treatURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        runTutorial()
    }
    
    func runTutorial() {
        if counter.prayerTip == false {
            counter.prayerTip = true
            ad.saveContext()
            let alertController = UIAlertController(title: "TIPS & TRICKS", message: "\nTIP - Turn your phone sideways to view in landscape mode.\n\nTIP - Pair your phone to your family room TV for all to see. There is suggested hardware in the “More” tab under “Tutorials” if you don't know what you would need.\n\nTRICK - Press on the orange home button in the top left corner to return to the home screen.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "✓ Got it!", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func detailsButtonPressed(_ sender: Any) {
        let URL = NSURL(string: "\(treatURL)")!
        let treatWebVC = SFSafariViewController(url: URL as URL)
        treatWebVC.delegate = self
        
        present(treatWebVC, animated: true, completion: nil)
    }
    
    @IBAction func closedButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskTreat
        if let task = specificTask.selectedTreat {
            treatTitleLabel.text = task.title
            treatCategoryLabel.text = task.category
            
            if task.url == nil || task.url == "" {
                treatURL = "https://www.pinterest.com/search/pins/?q=treats"
            } else {
                treatURL = task.url!
            }
        }
        
        if let assignee = specificTask.assignment {
            treatMemberPhotoImage.image = assignee.photo as? UIImage
            treatMemberNameLabel.text = assignee.name
        }
    }
}

extension TreatVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
