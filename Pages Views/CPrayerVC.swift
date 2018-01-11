//
//  CPrayerVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/30/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class CPrayerVC: UIViewController {
    @IBOutlet weak var prayerMemberPhotoImage: UIImageView!
    @IBOutlet weak var prayerMemberNameLabel: UILabel!
    @IBOutlet weak var prayerTitleLabel: UILabel!
    @IBOutlet weak var prayerDetailLabel: UILabel!
    
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
            let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTRICK - Press on the orange “🏠” (home) button in the top left corner to return to the home screen.\n\nTRICK - The steps to prayer can be edited in the prayer task.", preferredStyle: .alert)
            
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
        let specificTask = taskPrayerClosing
        if let task = specificTask.selectedClosing {
            prayerTitleLabel.text = task.title
            prayerDetailLabel.text = task.detail
        }
        
        if let assignee = specificTask.assignment {
            prayerMemberPhotoImage.image = assignee.photo as? UIImage
            prayerMemberNameLabel.text = assignee.name
        }
    }
}
