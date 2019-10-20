//
//  FamilyTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/2/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import SafariServices
import MessageUI

class FamilyTVC: UITableViewController, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate, FamilyCellDelegate, MFMessageComposeViewControllerDelegate {
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var viewHeight: UITableViewHeaderFooterView!
    @IBOutlet weak var imageHeight: UIImageView!
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.006879295688, green: 0.4784864783, blue: 0.9987255931, alpha: 1), NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 35)!]
        
        self.hideKeyboardWhenTappedAround()
        
        memberAttemptFetch()
        tableView.reloadData()
        
        runTutorial()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        if counter.launched > 5 && counter.launched % 5 == 0 && counter.seeApps == false && counter.hideSeeApps == false {
            counter.hideSeeApps = true
            ad.saveContext()
            
            checkIfUSerWantsToSeeMyOtherApps()
        }
        
        if counter.launched > 10 && counter.launched % 4 == 0 && counter.facebookRequest == false && counter.hideFaceBookRequest == false {
            counter.hideFaceBookRequest = true
            ad.saveContext()
            
            followMeOnFacebook()
        }
        
        let size = imageHeight.frame.size
        viewHeight.frame.size = size
        tableView.reloadData()
    }
    
    // MARK: - Text Field Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Tutorials Methods
    
    func runTutorial() {
        if counter.familyTip == false {
            counter.familyTip = true
            ad.saveContext()
            let alertController = UIAlertController(title: "Hi and welcome to the\nFamily Home Evening\n(FHE) app!\n", message: "\nThank you for installing the FHE app. I hope you enjoy it.\n-Rylan Evans\n\nSince this is your first time here, I will help guide you with “TIPS & TRICKS” alerts for each of the main pages. There is a prepopulated example family that you can either delete or modify. Press the “+” in the top right corner to begin...", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "✓ Got it!", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    // MARK: - Table View Methods
    
    // Title for header in section
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        guard let sectionInfo = memberController.sections,
    //            let index = Int(sectionInfo[section].name) else {return nil}
    //        if index == 0 {
    //            return "Not Attending"
    //        } else {
    //            return "Attending"
    //        }
    //    }
    
    // View for header in section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        
        let sectionTitle = memberController.sections
        var title = ""
        if Int(sectionTitle![section].name) == 0 {
            title = "NOT ATTENDING:"
        } else {
            title = "ATTENDING:"
        }
        
        let label = UILabel()
        label.text = title
        label.frame = CGRect(x: 15, y:5, width: 200, height: 25)
        label.font = UIFont(name: "American Typewriter", size: 15)!
        label.textColor = #colorLiteral(red: 0.006879295688, green: 0.4784864783, blue: 0.9987255931, alpha: 1)
        view.addSubview(label)
        
        return view
    }
    
    // Header height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = memberController.sections {
            return sections.count
        }
        return 1
    }
    
    // Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = memberController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    // Height for each row
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    // Congigure each cell for row at a spesific index
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "FamilyCell", for: indexPath) as! FamilyCell
        configureFamilyCell(cell: detailCell, indexPath: indexPath as NSIndexPath)
        detailCell.delegate = self
        return detailCell
    }
    
    // Function to configure each cell
    func configureFamilyCell(cell: FamilyCell, indexPath: NSIndexPath) {
        let member = memberController.object(at: indexPath as IndexPath)
        cell.configureFamilyCell(member: member)
    }
    
    // User did select row at a spesific index
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = memberController.fetchedObjects, objects.count > 0 {
            let sections = memberController.sections![indexPath.section]
            let member = sections.objects![indexPath.row]
            //            let members = memberController.fetchedObjects![indexPath.row]
            performSegue(withIdentifier: "MemberDetailsVCExisting", sender: member)
        }
    }
    
    // Prepare for segue to another view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MemberDetailsVCExisting" {
            if let destination = segue.destination as? FamilyDetailsVC {
                if let member = sender as? Member {
                    destination.memberToEdit = member
                }
            }
        }
    }
    
    // MARK: - Cell Delegate Attending
    
    func attendingNeedsChanged(_ sender: FamilyCell) {
        if let objects = memberController.fetchedObjects, objects.count > 0 {
            let indexPath = tableView.indexPath(for: sender)
            let sections = memberController.sections![(indexPath?.section)!]
            let member = sections.objects![(indexPath?.row)!]
            attendingValueToggle(member as! Member)
        }
    }
    
    // Change status of attending bool
    func attendingValueToggle(_ Member: Member) {
        Member.attending = !Member.attending
        ad.saveContext()
        tableView.reloadData()
    }
    
    // MARK: - Interface Builder Methods
    
    @IBAction func sendMessageToFamilyAboutAssignmentsButtonPressed(_ sender: Any) {
        if counter.launched > 1 {
            playClick()
        }
        let alertController = UIAlertController(title: "TEXT ASSIGNMENTS", message: "Do you want to send a reminder to your family about their assignments?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "✓ Send", style: .default, handler: {
            alert -> Void in
            self.shareWithNetWork()
        })
        
        let noAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
//    func shareWithNetWork() {
//        let array = tasksEnabledArray
//        var textString = ""
//        for eachObject in array {
//            textString += eachObject.name! + " = " + (eachObject.assignment?.name)! + "\n"
//        }
//        let string: String = String(textString)
//        if UIApplication.shared.canOpenURL(URL(string:"sms:")!) {
//            UIApplication.shared.open(URL(string:"sms:")!, options: [:], completionHandler: nil)
//        } else {
//            let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: nil)
//            present(activityViewController, animated: true, completion: nil)
//        }
//    }
    
    // MARK: - Alert Controller Methods
    
    func checkIfUSerWantsToSeeMyOtherApps() {
        let alertController = UIAlertController(title: "OTHER APPS?", message: "Are you intrested in seeing my other apps?", preferredStyle: .alert)
        
        let likeAction = UIAlertAction(title: "✓ Yes, I'll take a look.", style: .default, handler: {
            alert -> Void in
            self.allApps()
        })
        
        let dislikeAction = UIAlertAction(title: "✗ No, thank you.", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            counter.seeApps = true
            ad.saveContext()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel, maybe another time.", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(likeAction)
        alertController.addAction(dislikeAction)
        alertController.addAction(cancelAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func followMeOnFacebook() {
        let alertController = UIAlertController(title: "FACEBOOK", message: "Will you Like my Facebook page and follow me for future updates and apps?", preferredStyle: .alert)
        
        let likeAction = UIAlertAction(title: "✓ Yes, I'll Like you.", style: .default, handler: {
            alert -> Void in
            self.facebookFollower()
        })
        
        let dislikeAction = UIAlertAction(title: "✗ No, thank you.", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            counter.facebookRequest = true
            ad.saveContext()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel, maybe another time.", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(likeAction)
        alertController.addAction(dislikeAction)
        alertController.addAction(cancelAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func allApps() {
        UIApplication.shared.open(NSURL(string: "itms-apps://itunes.apple.com/us/developer/rylan-evans/id1224378808")! as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary(["":""]), completionHandler: nil)
        counter.seeApps = true
        ad.saveContext()
    }
    
    func facebookFollower() {
        let id = 660877290751092
        let url = NSURL(string: "fb://profile/\(id)")!
        if UIApplication.shared.canOpenURL(url as URL) == true {
            UIApplication.shared.open(url as URL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary(["":""]), completionHandler: nil)
        } else {
            let URL = NSURL(string: "https://www.facebook.com/rylanevans.apps/")!
            let facebookWeb = SFSafariViewController(url: URL as URL)
            facebookWeb.delegate = self
            
            present(facebookWeb, animated: true, completion: nil)
        }
        
        counter.facebookRequest = true
        ad.saveContext()
    }
    
    // MARK: - Message Compose View Controller
    
    func shareWithNetWork() {
        let array = tasksEnabledArray
        var textString = "FHE Assignments:\n"
        for eachObject in array {
            textString += eachObject.name! + " = " + (eachObject.assignment?.name)! + "\n"
        }
        if MFMessageComposeViewController.canSendText() == true {
//            let recipients:[String] = ["phoneNumbers"]
            let messageController = MFMessageComposeViewController()
            messageController.messageComposeDelegate  = self
//            messageController.recipients = recipients
            messageController.body = "\(textString)👨‍👩‍👧‍👦🏠🌙"
            self.present(messageController, animated: true, completion: nil)
        } else {
            let activityViewController = UIActivityViewController(activityItems: [textString], applicationActivities: nil)
            present(activityViewController, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        controller.dismiss(animated: true, completion: nil)
    }

    
    // MARK: - Boiler Code for Core Data
    
    var memberController: NSFetchedResultsController<Member>!
    
    func memberAttemptFetch() {
        let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
        let sortByAttending = NSSortDescriptor(key: "attending", ascending: false)
        let sortByAge = NSSortDescriptor(key: "age", ascending: true)
        let filterOutAutoAssign = NSPredicate(format: "name != %@", "Auto-Assign")
        
        fetchRequest.predicate = filterOutAutoAssign
        fetchRequest.sortDescriptors = [sortByAttending, sortByAge]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "attending", cacheName: nil)
        controller.delegate = self
        self.memberController = controller
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.endUpdates()
    }
    
    // Object did change
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type){
            
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
            tableView.reloadData()
            break
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            tableView.reloadData()
            break
        case .update:
            if let indexPath = indexPath {
                if let cellDetail = tableView.cellForRow(at: indexPath) as? FamilyCell {
                    configureFamilyCell(cell: cellDetail, indexPath: indexPath as NSIndexPath)
                }
                
                if let cellTitle = tableView.cellForRow(at: indexPath) as? FamilyCell {
                    configureFamilyCell(cell: cellTitle, indexPath: indexPath as NSIndexPath)
                }
            }
            tableView.reloadData()
            break
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
            tableView.reloadData()
            break
        @unknown default:
            fatalError("Error with unknown default")
        }
    }
    
    // Section did change
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange sectionInfo: NSFetchedResultsSectionInfo, atSectionIndex sectionIndex: Int, for type: NSFetchedResultsChangeType) {
        switch type {
        case .delete:
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .automatic)
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .automatic)
        default:
            break
        }
    }
}

extension FamilyTVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
	return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}
