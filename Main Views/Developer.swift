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
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.006879295688, green: 0.4784864783, blue: 0.9987255931, alpha: 1),
            NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
        
        clickSoundURL()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.playClick()
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0: aboutRylan()
            case 1: allApps()
            case 2: basketballSSTapped()
            case 3: shareWithNetwork()
            case 4: digiLilly()
            case 5: rylanEvans()
            case 6: facebook()
            case 7: twitter()
            case 8: patreon()
            default: print("Error with MoreTVC index selection")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    func aboutRylan() {
    }
    
    func rylanEvans() {
        let URL = NSURL(string: "https://www.rylanevans.com")!
        let rylanEvansWeb = SFSafariViewController(url: URL as URL)
        rylanEvansWeb.delegate = self
        
        present(rylanEvansWeb, animated: true, completion: nil)
    }

    func basketballSSTapped() {
        UIApplication.shared.open(NSURL(string: "itms-apps://itunes.apple.com/app/id1224378809?")! as URL, options: ["":""], completionHandler: nil)
    }
    
    func shareWithNetwork() {
        let string: String = String("Checkout this Family Home Evening App!\n\nitms-apps://itunes.apple.com/us/app/apple-store/id1292069519?")
        let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    func allApps() {
        UIApplication.shared.open(NSURL(string: "itms-apps://itunes.apple.com/us/developer/rylan-evans/id1224378808")! as URL, options: ["":""], completionHandler: nil)
    }
    
    func digiLilly() {
        let URL = NSURL(string: "https://sites.google.com/view/digi-lilly/home")!
        let rylanEvansWeb = SFSafariViewController(url: URL as URL)
        rylanEvansWeb.delegate = self
        
        present(rylanEvansWeb, animated: true, completion: nil)
    }
    
    func facebook() {
        let URL = NSURL(string: "https://www.facebook.com/rylanevans.apps/")!
        let facebookWeb = SFSafariViewController(url: URL as URL)
        facebookWeb.delegate = self
        
        present(facebookWeb, animated: true, completion: nil)
    }
    
    // MARK: -  MFMailComposeViewControllerDelegate Method to subscribe
    
    func twitter() {
        let URL = NSURL(string: "https://twitter.com/rylan_evans")!
        let twitterWeb = SFSafariViewController(url: URL as URL)
        twitterWeb.delegate = self
        
        present(twitterWeb, animated: true, completion: nil)
    }
    
    func patreon() {
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
