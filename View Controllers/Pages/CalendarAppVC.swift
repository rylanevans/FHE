//
//  CalendarAppVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/16/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit

class CalendarAppVC: UIViewController {
    
    @IBAction func showCalendarButton(_ sender: Any) {
        gotoAppleCalendar(date: Date() as NSDate)
//        let myURL = URL(string: "calshow://")
//        let myRequest = URLRequest(url: myURL!)
//        _ = myRequest
    }
    
    func gotoAppleCalendar(date: NSDate) {
        let interval = date.timeIntervalSinceReferenceDate
        let url = NSURL(string: "calshow:\(interval)")!
        UIApplication.shared.openURL(url as URL)
    }
}

