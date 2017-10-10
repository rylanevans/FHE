//
//  MoreTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/3/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import MessageUI
import StoreKit

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
        self.clickSoundURL()
        
        InAppPurchasesService.instance.delegate = self
        InAppPurchasesService.instance.loadProducts()
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePurchase(_ :)), name: NSNotification.Name(IAPServicePurchaseNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleFailure), name: NSNotification.Name(IAPServiceFailureNotification), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func handlePurchase(_ notification: Notification) {
        guard let productID = notification.object as? String else { return }
        switch productID {
        case IAP_FHE_ID_thankYou:
            debugPrint("Purchase was made for $1.99")
            break
        default:
            break
        }
    }
    
    @objc func handleFailure() {
        print("Purchase Failed")
    }
    
    func hideAdsBtnWasPressed(_ sender: Any) {
        InAppPurchasesService.instance.attemptPurchaseForItemWith(productIndex: .hideAds)
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
        SKStoreReviewController.requestReview()
    }
    
    
    // MARK: - Activity view contorller share options
    
    func shareWithNetwork() {
        let string: String = String("Checkout this Family Home Evening App!\n\nitms-apps://itunes.apple.com/us/app/apple-store/id1292069519?mt=8")
        let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: -  MFMailComposeViewControllerDelegate Method to report a problem
    
    func reportProblem() {
        guard MFMailComposeViewController.canSendMail() else {return}
        let modelName = UIDevice.current.modelName
        let OSVersion = UIDevice.current.systemVersion
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["rylanjevans@gmail.com"])
        mailController.setSubject("FHE App Bugs")
        mailController.setMessageBody("Please provide details to the problem(s) you are experiencing...\n\n\n\n\nDeveloper Support Information:\n📱 Device Type = \(modelName)\n⚙️ Operating System = \(OSVersion)\n🛠 App Version = \(appVersion ?? "Info not avaliable")", isHTML: false)
        
        self.present(mailController, animated: true, completion: nil)
    }
    
    // MARK: -  MFMailComposeViewControllerDelegate Method to provide suggestions
    
    func suggestions() {
        guard MFMailComposeViewController.canSendMail() else {return}
        let modelName = UIDevice.current.modelName
        let OSVersion = UIDevice.current.systemVersion
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["rylanjevans@gmail.com"])
        mailController.setSubject("FHE App Tips")
        mailController.setMessageBody("Please provide details to any feature requests or suggestions on how to improve the app below...\n\n\n\n\nDeveloper Support Information:\n📱 Device Type = \(modelName)\n⚙️ Operating System = \(OSVersion)\n🛠 App Version = \(appVersion ?? "Info not avaliable")", isHTML: false)
        
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
            case 1: thankYou()
            case 2: likeIt()
            case 3: loveIt()
            case 4: amazing()
            case 6: shareWithNetwork()
            case 7: positiveFeedback()
            case 8: reportProblem()
            case 9: suggestions()
            case 10: subscribe()
            default:
                print("Error with MoreTVC index selection")
            }
        }
    }
}

extension MoreTVC: IAPServiceDelege {
    func iapProductsLoaded() {
        print("IAP Products loaded")
    }
}

public extension UIDevice {
    
    var modelName: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        switch identifier {
        case "iPod5,1":                                 return "iPod Touch 5"
        case "iPod7,1":                                 return "iPod Touch 6"
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     return "iPhone 4"
        case "iPhone4,1":                               return "iPhone 4s"
        case "iPhone5,1", "iPhone5,2":                  return "iPhone 5"
        case "iPhone5,3", "iPhone5,4":                  return "iPhone 5c"
        case "iPhone6,1", "iPhone6,2":                  return "iPhone 5s"
        case "iPhone7,2":                               return "iPhone 6"
        case "iPhone7,1":                               return "iPhone 6 Plus"
        case "iPhone8,1":                               return "iPhone 6s"
        case "iPhone8,2":                               return "iPhone 6s Plus"
        case "iPhone9,1", "iPhone9,3":                  return "iPhone 7"
        case "iPhone9,2", "iPhone9,4":                  return "iPhone 7 Plus"
        case "iPhone8,4":                               return "iPhone SE"
        case "iPhone10,1", "iPhone10,4":                return "iPhone 8"
        case "iPhone10,2", "iPhone10,5":                return "iPhone 8 Plus"
        case "iPhone10,3", "iPhone10,6":                return "iPhone X"
        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":return "iPad 2"
        case "iPad3,1", "iPad3,2", "iPad3,3":           return "iPad 3"
        case "iPad3,4", "iPad3,5", "iPad3,6":           return "iPad 4"
        case "iPad4,1", "iPad4,2", "iPad4,3":           return "iPad Air"
        case "iPad5,3", "iPad5,4":                      return "iPad Air 2"
        case "iPad6,11", "iPad6,12":                    return "iPad 5"
        case "iPad2,5", "iPad2,6", "iPad2,7":           return "iPad Mini"
        case "iPad4,4", "iPad4,5", "iPad4,6":           return "iPad Mini 2"
        case "iPad4,7", "iPad4,8", "iPad4,9":           return "iPad Mini 3"
        case "iPad5,1", "iPad5,2":                      return "iPad Mini 4"
        case "iPad6,3", "iPad6,4":                      return "iPad Pro 9.7 Inch"
        case "iPad6,7", "iPad6,8":                      return "iPad Pro 12.9 Inch"
        case "iPad7,1", "iPad7,2":                      return "iPad Pro 12.9 Inch 2. Generation"
        case "iPad7,3", "iPad7,4":                      return "iPad Pro 10.5 Inch"
        case "AppleTV5,3":                              return "Apple TV"
        case "AppleTV6,2":                              return "Apple TV 4K"
        case "AudioAccessory1,1":                       return "HomePod"
        case "i386", "x86_64":                          return "Simulator"
        default:                                        return identifier
        }
    }
}
