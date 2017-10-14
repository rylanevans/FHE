//
//  OtherAppsTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class OtherAppsTVC: UITableViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var tableCell: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickSoundURL()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.playClick()
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0: rylanEvansTapped()
            case 1: basketballSSTapped()
            case 2: shareWithNetwork()
            case 3: subscribe()
            default:
                print("Error with MoreTVC index selection")
            }
        }
    }
    
    func rylanEvansTapped() {
        playClick()
        let URL = NSURL(string: "https://www.rylanevans.com")!
        let OtherAppsWeb = SFSafariViewController(url: URL as URL)
        OtherAppsWeb.delegate = self
        
        present(OtherAppsWeb, animated: true, completion: nil)
    }
    
    func basketballSSTapped() {
        playClick()
        UIApplication.shared.open(NSURL(string: "itms-apps://itunes.apple.com/app/id1224378809?")! as URL, options: ["":""], completionHandler: nil)
        
        //        UIApplication.shared.openURL(NSURL(string: "https://itunes.apple.com/us/app/basketball-simple-stats/id1224378809?")! as URL)
        
        //        UIApplication.shared.open(NSURL("https://itunes.apple.com/us/app/basketball-simple-stats/id1224378809?") as URL, options: [:], completionHandler: nil)
    }
    
    func shareWithNetwork() {
        playClick()
        let string: String = String("Checkout this Family Home Evening App!\n\nitms-apps://itunes.apple.com/us/app/apple-store/id1292069519?")
        let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: -  MFMailComposeViewControllerDelegate Method to subscribe
    
    func subscribe() {
        playClick()
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["subscribe@rylanevans.com"])
        mailController.setSubject("FHE App Subscription")
        mailController.setMessageBody("Please add any emails below that you would like to include for future updates and new app releases...", isHTML: false)
        
        self.present(mailController, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension OtherAppsTVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
