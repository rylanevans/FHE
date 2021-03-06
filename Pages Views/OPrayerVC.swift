//
//  PrayerVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class OPrayerVC: UIViewController {
    
    // MARK: - Custom Variables
    
    @IBOutlet weak var prayerMemberPhotoImage: UIImageView!
    @IBOutlet weak var prayerMemberNameLabel: UILabel!
    @IBOutlet weak var prayerTitleLabel: UILabel!
    @IBOutlet weak var prayerDetailLabel: UILabel!
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMembersAttending()
        getAllTasks()
        loadPageData()
    }
    
    // MARK: - Interface Builder Methods
    
    @objc func gestureRecognizerAction(_ gesture: UIPanGestureRecognizer) {
        print(gesture)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Load Content
    
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
