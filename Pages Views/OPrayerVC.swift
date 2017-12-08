//
//  PrayerVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class OPrayerVC: UIViewController {
    @IBOutlet weak var prayerMemberPhotoImage: UIStackView!
    @IBOutlet weak var prayerMemberNameLabel: UILabel!
    @IBOutlet weak var prayerTitleLabel: UILabel!
    @IBOutlet weak var prayerDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadOpeningPrayerPageData()
    }
    
    @objc func gestureRecognizerAction(_ gesture: UIPanGestureRecognizer) {
        print(gesture)
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
    
    func loadOpeningPrayerPageData() {
//        var assignee = Member()
//        var selected = Prayer()
//
//        let prayer = selectedPrayer
//
//        if prayer.assignment != nil {
//            assignee = prayer.assignment!
//        }
//
//        if prayer.selectedSong != nil {
//            selected = prayer.selectedSong!
//        }
//
//        prayerMemberNameLabel.text = assignee.name
//        prayerMemberPhotoImage.image = assignee.photo as? UIImage
//        prayerTitleLabel.text = selected.title
//        prayerDetailLabel
    }
}
