//
//  Artist.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import SafariServices
import MessageUI

class ArtistTVC: UITableViewController, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.006879295688, green: 0.4784864783, blue: 0.9987255931, alpha: 1),
            NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0: emailJosephine()
            case 1: tapas()
            case 2: facebook()
            case 3: patreon()
            default: print("Error with MoreTVC index selection")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func emailJosephine() {
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["goodmoejo@gmail.com"])
        mailController.setSubject("LDS-FHE Sticker Artist Request")
        mailController.setMessageBody("Dear Josephine,\n\nI'm reaching out because...", isHTML: false)
        
        self.present(mailController, animated: true, completion: nil)
    }
    
    func tapas() {
        let URL = NSURL(string: "https://tapas.io/goodmoejo")!
        let tapasWeb = SFSafariViewController(url: URL as URL)
        tapasWeb.delegate = self
        
        present(tapasWeb, animated: true, completion: nil)
    }
    
    func facebook() {
        let id = 24424629347498
        let url = NSURL(string: "fb://profile/\(id)")!
        if UIApplication.shared.canOpenURL(url as URL) == true {
            UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary(["":""]), completionHandler: nil)
        } else {
            let URL = NSURL(string: "https://www.facebook.com/jomoellmer/")!
            let facebookWeb = SFSafariViewController(url: URL as URL)
            facebookWeb.delegate = self
            
            present(facebookWeb, animated: true, completion: nil)
        }
    }
    
    func patreon() {
        let id = "GoodMoeJo"
        let url = NSURL(string: "https://www.patreon.com/\(id)")!
        
        if UIApplication.shared.canOpenURL(url as URL) == true {
            UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary(["":""]), completionHandler: nil)
        } else {
            let URL = NSURL(string: "https://www.patreon.com/GoodMoeJo")!
            
            let patreonWebVC = SFSafariViewController(url: URL as URL)
            patreonWebVC.delegate = self
            
            present(patreonWebVC, animated: true, completion: nil)
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}

extension ArtistTVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
