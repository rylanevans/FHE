//
//  TestimonyVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class TestimonyVC: UIViewController {
    @IBOutlet weak var testimonyMemberPhotoImage: UIImageView!
    @IBOutlet weak var testimonyMemberNameLabel: UILabel!
    @IBOutlet weak var testimonyTitleLabel: UILabel!
    @IBOutlet weak var testimonyDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        runTutorial()
    }
    
    func runTutorial() {
        if counter.testimonyTip == false {
            counter.testimonyTip = true
            ad.saveContext()
            let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - The testimony bullet points are only a list of suggestions. Pick one or more bullet points to testify about to your family members. Don't stress about the whole list.", preferredStyle: .alert)
            
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
        let specificTask = taskTestimony
        if let task = specificTask.selectedTestimony {
            testimonyTitleLabel.text = task.title
            testimonyDetailLabel.text = task.detail
        }
        if let assignee = specificTask.assignment {
            testimonyMemberPhotoImage.image = assignee.photo as? UIImage
            testimonyMemberNameLabel.text = assignee.name
        }
    }
}
