//
//  DeveloperTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class DeveloperTVC: UITableViewController, MFMailComposeViewControllerDelegate {
    
    @IBOutlet weak var tableCell: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.1340000033, green: 0.1679999977, blue: 0.5, alpha: 1),
            NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
        
        clickSoundURL()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.playClick()
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0: aboutRylan()
            case 1: rylanEvans()
            case 2: basketballSSTapped()
            case 3: shareWithNetwork()
            case 4: facebook()
            case 5: twitter()
            case 6: patreon()
            default: print("Error with MoreTVC index selection")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func rylanEvans() {
//        playClick()
        let URL = NSURL(string: "https://www.rylanevans.com")!
        let rylanEvansWeb = SFSafariViewController(url: URL as URL)
        rylanEvansWeb.delegate = self
        
        present(rylanEvansWeb, animated: true, completion: nil)
    }
    
    func aboutRylan() {
//        playClick()
    }
    
    func basketballSSTapped() {
//        playClick()
        UIApplication.shared.open(NSURL(string: "itms-apps://itunes.apple.com/app/id1224378809?")! as URL, options: ["":""], completionHandler: nil)
        
        //        UIApplication.shared.openURL(NSURL(string: "https://itunes.apple.com/us/app/basketball-simple-stats/id1224378809?")! as URL)
        
        //        UIApplication.shared.open(NSURL("https://itunes.apple.com/us/app/basketball-simple-stats/id1224378809?") as URL, options: [:], completionHandler: nil)
    }
    
    func shareWithNetwork() {
//        playClick()
        let string: String = String("Checkout this Family Home Evening App!\n\nitms-apps://itunes.apple.com/us/app/apple-store/id1292069519?")
        let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    func facebook() {
//        playClick()
        let URL = NSURL(string: "https://www.facebook.com/rylanevans.apps/")!
        let facebookWeb = SFSafariViewController(url: URL as URL)
        facebookWeb.delegate = self
        
        present(facebookWeb, animated: true, completion: nil)
    }
    
    // MARK: -  MFMailComposeViewControllerDelegate Method to subscribe
    
    func twitter() {
//        playClick()
        let URL = NSURL(string: "https://twitter.com/rylan_evans")!
        let twitterWeb = SFSafariViewController(url: URL as URL)
        twitterWeb.delegate = self
        
        present(twitterWeb, animated: true, completion: nil)
    }
    
    func patreon() {
//        playClick()
        let URL = NSURL(string: "https://www.patreon.com/rylanevans")!
        let patreonWeb = SFSafariViewController(url: URL as URL)
        patreonWeb.delegate = self
        
        present(patreonWeb, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension DeveloperTVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
