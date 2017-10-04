//
//  MoreTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/3/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import AVFoundation

class MoreTVC: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func thankYou() {
        print("Thank you")
    }
    
    func likeIt() {
        print("Like it")
    }
    
    func loveIt() {
        print("Love it")
    }
    
    func amazing() {
        print("Amazing")
    }
    
    func positiveFeedback() {
        let appID = "itms-apps://itunes.apple.com/us/app/apple-store/id1292069519?mt=8"
        if let url = URL(string: "\(appID)") {
            UIApplication.shared.open(url)
        }
    }
    
    func shareWithNetwork() {
        let string: String = "Checkout this Family Home Evening App!\n\nhttps://itunes.apple.com/us/app/basketball-simple-stats/id1292069519?mt=8"
        
        let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    func reportProblem() {
        let mailToReportProblem = "mailto:rylanjevans@gmail.com?&subject=FHE%20App%20Bug&body=Report%20your%20problem%20below..."
        if let url = URL(string: "\(mailToReportProblem)") {
            UIApplication.shared.open(url)
        }
    }
    
    func suggestions() {
        let mailToReportProblem = "mailto:rylanjevans@gmail.com?&subject=FHE%20App%20Suggestions&body=Make%20any%20suggestion%20below..."
        if let url = URL(string: "\(mailToReportProblem)") {
            UIApplication.shared.open(url)
        }
    }
    
    func subscribe() {
        let mailToReportProblem = "mailto:rylanjevans@gmail.com?&subject=FHE%20App%20Subscription&body=Please%20add%20me%20to%20future%20updates%20and/or%20apps%20you%20build."
        if let url = URL(string: "\(mailToReportProblem)") {
            UIApplication.shared.open(url)
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0: thankYou()
            case 1: likeIt()
            case 2: loveIt()
            case 3: amazing()
            default:
                print("Error with MoreTVC index selection")
            }
        } else if
            indexPath.section == 1 {
            switch indexPath.row {
            case 0: shareWithNetwork()
            case 1: positiveFeedback()
            case 2: reportProblem()
            case 3: suggestions()
            case 4: subscribe()
            default:
                print("Error with MoreTVC index selection")
            }
        }
    }
}
