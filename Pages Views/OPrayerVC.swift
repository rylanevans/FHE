//
//  PrayerVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class OPrayerVC: UIViewController {
    @IBOutlet weak var prayerMemberPhotoImage: UIImageView!
    @IBOutlet weak var prayerMemberNameLabel: UILabel!
    @IBOutlet weak var prayerTitleLabel: UILabel!
    @IBOutlet weak var prayerDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @objc func gestureRecognizerAction(_ gesture: UIPanGestureRecognizer) {
        print(gesture)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func loadPageData() {
        let specificTask = taskPrayer
        let task = specificTask.selectedPrayer
        let assignee = specificTask.assignment
        
        prayerMemberPhotoImage.image = assignee?.photo as? UIImage
        prayerMemberNameLabel.text = assignee?.name
        prayerTitleLabel.text = task?.title
        prayerDetailLabel.text = task?.detail
    }
}
