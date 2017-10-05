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
import AVFoundation

class MoreTVC: UITableViewController, MFMailComposeViewControllerDelegate {
    
    // MARK: - View did load settings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.4755483866, blue: 0.9911283851, alpha: 1),
            NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
        clickSoundURL()
        
        InAppPurchasesService.instance.delegate = self
        InAppPurchasesService.instance.loadProducts()
    }
    
    // MARK: - Functions for each table view cell
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func thankYou() {
        InAppPurchasesService.instance.attemptPurchaseForItemWith(productIndex: .thankYou)
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
    
    // MARK: - Activity view contorller share options
    
    func shareWithNetwork() {
        let string: String = "Checkout this Family Home Evening App!\n\nhttps://itunes.apple.com/us/app/basketball-simple-stats/id1292069519?mt=8"
        let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: -  MFMailComposeViewControllerDelegate Method to report a problem
    
    func reportProblem() {
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["rylanjevans@gmail.com"])
        mailController.setSubject("FHE App Bugs")
        mailController.setMessageBody("Please provide details to the problem(s) you are experiencing...", isHTML: false)
        
        self.present(mailController, animated: true, completion: nil)
    }
    
    // MARK: -  MFMailComposeViewControllerDelegate Method to provide suggestions

    func suggestions() {
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["rylanjevans@gmail.com"])
        mailController.setSubject("FHE App Tips")
        mailController.setMessageBody("Please provide details to any feature requests or suggestions on how to improve the app below...", isHTML: false)
        
        self.present(mailController, animated: true, completion: nil)
    }
    
    // MARK: -  MFMailComposeViewControllerDelegate Method to subscribe
    
    func subscribe() {
        guard MFMailComposeViewController.canSendMail() else {return}
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["rylanjevans@gmail.com"])
        mailController.setSubject("FHE App Subscription")
        mailController.setMessageBody("Please add any emails below that you would like to include for future updates and new app releases...", isHTML: false)
        
        self.present(mailController, animated: true, completion: nil)
    }
    
    // MARK: - Did select row at calls certain functions
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0: thankYou(); playClick()
            case 1: likeIt(); playClick()
            case 2: loveIt(); playClick()
            case 3: amazing(); playClick()
            default:
                print("Error with MoreTVC index selection")
            }
        } else if
            indexPath.section == 1 {
            switch indexPath.row {
            case 0: shareWithNetwork(); playClick()
            case 1: positiveFeedback(); playClick()
            case 2: reportProblem(); playClick()
            case 3: suggestions(); playClick()
            case 4: subscribe(); playClick()
            default:
                print("Error with MoreTVC index selection")
            }
        }
    }
    
    // MARK: - Audio bioler plate
    
    var clickSound: AVAudioPlayer!
    
    func clickSoundURL() {
        let click = Bundle.main.path(forResource: "Click", ofType: "wav")
        let clickURL = URL(fileURLWithPath: click!)
        do {
            try clickSound = AVAudioPlayer(contentsOf: clickURL)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func playClick() {
        if clickSound.isPlaying {
            clickSound.stop()
        }
        clickSound.play()
    }
}

extension MoreTVC: IAPServiceDelege {
    func iapProductsLoaded() {
        print("IAP Products loaded")
    }
}
