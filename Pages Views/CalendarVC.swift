//
//  CalendarVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/16/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class CalendarVC: UIViewController {
    @IBOutlet weak var calendarMemberPhotoImage: UIImageView!
    @IBOutlet weak var calendarMemberNameLabel: UILabel!
    @IBOutlet weak var calendarTitleLabel: UILabel!
    @IBOutlet weak var calendarDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadPageData()
    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func showCalendarButton(_ sender: Any) {
        gotoAppleCalendar(date: Date() as NSDate)
    }
    
    func gotoAppleCalendar(date: NSDate) {
        let interval = date.timeIntervalSinceReferenceDate
        let url = NSURL(string: "calshow:\(interval)")!
        UIApplication.shared.open(url as URL, options: ["":""], completionHandler: nil)
    }
    
    func loadPageData() {
        let specificTask = taskCalendar
        let task = specificTask.selectedCalendar
        let assignee = specificTask.assignment
        
        calendarMemberPhotoImage.image = assignee?.photo as? UIImage
        calendarMemberNameLabel.text = assignee?.name
        calendarTitleLabel.text = task?.title
        calendarDetailLabel.text = task?.detail
    }
}


