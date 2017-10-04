//
//  MoreTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/3/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import AVFoundation
import MessageUI

class MoreTVC: UITableViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.4755483866, blue: 0.9911283851, alpha: 1),
            NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
    }
    
    // MARK: -  MFMailComposeViewControllerDelegate Method
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
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
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["rylanjevans@gmail.com"])
        mailController.setSubject("FHE App Bugs")
        mailController.setMessageBody("Please provide details to the problem(s) you are experiencing...", isHTML: false)
        
        self.present(mailController, animated: true, completion: nil)
    }

    func suggestions() {
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["rylanjevans@gmail.com"])
        mailController.setSubject("FHE App Tips")
        mailController.setMessageBody("Please provide details to any feature requests or suggestions on how to improve the app below...", isHTML: false)
        
        self.present(mailController, animated: true, completion: nil)
    }
    
    func subscribe() {
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["rylanjevans@gmail.com"])
        mailController.setSubject("FHE App Subscription")
        mailController.setMessageBody("Please add any emails below that you would like to include for future updates and new app releases...", isHTML: false)
        
        self.present(mailController, animated: true, completion: nil)
//        let mailToReportProblem = "mailto:rylanjevans@gmail.com?&subject=FHE%20App%20Subscription&body=Please%20add%20me%20to%20future%20updates%20and/or%20apps%20you%20build."
//        if let url = URL(string: "\(mailToReportProblem)") {
//            UIApplication.shared.open(url)
//        }
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
