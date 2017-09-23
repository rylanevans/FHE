//
//  CalendarVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/16/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {
    
    @IBAction func closeWindowButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showCalendarButton(_ sender: Any) {
        gotoAppleCalendar(date: Date() as NSDate)
    }
    
    func gotoAppleCalendar(date: NSDate) {
        let interval = date.timeIntervalSinceReferenceDate
        let url = NSURL(string: "calshow:\(interval)")!
//        UIApplication.shared.openURL(url as URL)
        UIApplication.shared.open(url as URL, options: ["":""], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
