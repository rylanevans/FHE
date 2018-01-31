//
//  PrepareTVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/20/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import StoreKit
import CoreData
import MessageUI

class TasksTVC: UITableViewController, NSFetchedResultsControllerDelegate, TaskCellDelegate, MFMailComposeViewControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.006879295688, green: 0.4784864783, blue: 0.9987255931, alpha: 1),
            NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
        
        clickSoundURL()
        
        taskAttemptFetch()
        tableView.reloadData()
        
        runTutorial()
    }
    
    override func viewDidAppear(_ animated: Bool) {        
        taskAttemptFetch()
        tableView.reloadData()
        
        if counter.launched > 5 && counter.launched % 2 == 0 && counter.feedbackGiven == false && counter.hideFeedbackRequest == false {
            counter.hideFeedbackRequest = true
            ad.saveContext()
            
            checkPositiveOrNegitiveFeedback()
        }
        
        if counter.launched > 5 && counter.launched % 2 != 0 && counter.shared == false && counter.hideSharedRequest == false {
            counter.hideSharedRequest = true
            ad.saveContext()
            
            checkIfUserWantsToShare()
        }
    }
    
    func runTutorial() {
        if counter.tasksTip == false {
            counter.tasksTip = true
            ad.saveContext()
            let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTIP - I suggest you turn everything on the first time to get an idea of what's avaliable and which ones you may like to have enabled for your family. After you've seen each of the tasks “disable” those you want off.\n\nTIP - See tutorials in the “More” tab for video demos or to see any of the “TIPS & TRICKS” you may want to review again.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    func checkPositiveOrNegitiveFeedback() {
        let alertController = UIAlertController(title: "👍 APP FEEDBACK?", message: "Are you enjoying the FHE app?", preferredStyle: .alert)
        
        let likeAction = UIAlertAction(title: "✓ Yes", style: .default, handler: {
            alert -> Void in
            self.positiveReview()
        })
        
        let dislikeAction = UIAlertAction(title: "✗ No", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
            self.suggestions()
        })
        
        let cancelAction = UIAlertAction(title: "⌀ Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(likeAction)
        alertController.addAction(dislikeAction)
        alertController.addAction(cancelAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func positiveReview() {
        counter.feedbackGiven = true
        ad.saveContext()
        
        UIApplication.shared.open(NSURL(string: "itms-apps://itunes.apple.com/app/id1292069519?action=write-review")! as URL, options: ["":""], completionHandler: nil)
    }
    
    // MARK: -  MFMailComposeViewControllerDelegate Method to provide suggestions
    
    func suggestions() {
        counter.feedbackGiven = true
        ad.saveContext()
        
        guard MFMailComposeViewController.canSendMail() else {return}
        let modelName = UIDevice.current.modelName
        let OSVersion = UIDevice.current.systemVersion
        let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
        let mailController = MFMailComposeViewController()
        mailController.mailComposeDelegate = self
        mailController.setToRecipients(["rylanevans@hotmail.com"])
        mailController.setSubject("FHE App Tips")
        mailController.setMessageBody("Please provide details to any feature requests or suggestions on how to improve the app below...\n\n\n\n\nDeveloper Support Information:\n📱 Device Type = \(modelName)\n⚙️ Operating System = \(OSVersion)\n🛠 App Version = \(appVersion ?? "Info not avaliable")", isHTML: false)
        
        self.present(mailController, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
    func checkIfUserWantsToShare() {
        let alertController = UIAlertController(title: "📣 SHARE APP?", message: "Will you share the FHE app with your friends and family?", preferredStyle: .alert)
        
        let yesAction = UIAlertAction(title: "✓ Yea, sure", style: .default, handler: {
            alert -> Void in
            self.shareWithNetWork()
        })
        
        let noAction = UIAlertAction(title: "✗ No, thanks", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(noAction)
        alertController.addAction(yesAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func shareWithNetWork() {
        counter.shared = true
        ad.saveContext()
        
        let string: String = String("Checkout this Family Home Evening App!\n\nitms-apps://itunes.apple.com/us/app/apple-store/id1292069519?")
        let activityViewController = UIActivityViewController(activityItems: [string], applicationActivities: nil)
        present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: - Table view data source
    
    // View for header in section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        
        let sectionTitle = taskController.sections
        var title = ""
        if Int(sectionTitle![section].name) == 0 {
            title = "DISABLED:"
        } else {
            title = "ENABLED:"
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
        if let sections = taskController.sections {
            return sections.count
        }
        return 1
    }
    
    // Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = taskController.sections {
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
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskCell
        configureTaskCell(cell: detailCell, indexPath: indexPath as NSIndexPath)
        detailCell.delegate = self
        return detailCell
    }
    
    // Function to configure each cell
    func configureTaskCell(cell: TaskCell, indexPath: NSIndexPath) {
        let task = taskController.object(at: indexPath as IndexPath)
        cell.configureTaskCell(task: task)
    }
    
    // User did select row at a spesific index
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = taskController.fetchedObjects, objects.count > 0 {
            let sections = taskController.sections![indexPath.section]
            let task = sections.objects![indexPath.row]
//            performSegue(withIdentifier: "ShowSongs", sender: task)
            let segueTask = task as! Task
            switch segueTask.name {
            case "Opening Prayer"?: performSegue(withIdentifier: "ShowOPrayer", sender: task)
            case "Closing Prayer"?: performSegue(withIdentifier: "ShowCPrayer", sender: task)
            case "Song"?: performSegue(withIdentifier: "ShowSongs", sender: task)
            case "Rule"?: performSegue(withIdentifier: "ShowRules", sender: task)
            case "Scripture"?: performSegue(withIdentifier: "ShowScriptures", sender: task)
            case "Calendar"?: performSegue(withIdentifier: "ShowCalendar", sender: task)
            case "Testimony"?: performSegue(withIdentifier: "ShowTestimony", sender: task)
            case "Spotlight"?: performSegue(withIdentifier: "ShowSpotlight", sender: task)
            case "Thought"?: performSegue(withIdentifier: "ShowThought", sender: task)
            case "Quote"?: performSegue(withIdentifier: "ShowQuotes", sender: task)
            case "Lesson"?: performSegue(withIdentifier: "ShowLessons", sender: task)
            case "Council"?: performSegue(withIdentifier: "ShowCouncil", sender: task)
            case "Activity"?: performSegue(withIdentifier: "ShowGames", sender: task)
            case "Closing Prayer"?: performSegue(withIdentifier: "ShowPrayer", sender: task)
            case "Treat"?: performSegue(withIdentifier: "ShowTreats", sender: task)
            default: performSegue(withIdentifier: "ShowPrayer", sender: task)
            }
        }
    }
    
    // Prepare for segue to another view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSongs" {
            if let destination = segue.destination as? SongDetailsVC {
                present(destination, animated: true, completion: nil)
            }
        }
    }
    
    // MARK: - Task Cell Delegate
    
    func enabledNeedsChanged(_ sender: TaskCell) {
        if let objects = taskController.fetchedObjects, objects.count > 0 {
            let indexPath = tableView.indexPath(for: sender)
            let sections = taskController.sections![(indexPath?.section)!]
            let task = sections.objects![(indexPath?.row)!]
            selectedValueToggle(task as! Task)
        }
    }
    
    // Change status of selected bool
    func selectedValueToggle(_ Task: Task) {
        Task.enabled = !Task.enabled
        Task.assigned = false
        ad.saveContext()
        runAssignmentsYoungestToOldest()
        tableView.reloadData()
    }
    
    // MARK: - Boiler Code for Core Data
    
    var taskController: NSFetchedResultsController<Task>!
    
    func taskAttemptFetch() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        let sortByDefault = NSSortDescriptor(key: "defaultNumber", ascending: true)
        let sortByEnabled = NSSortDescriptor(key: "enabled", ascending: false)
        fetchRequest.sortDescriptors = [sortByEnabled, sortByDefault]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "enabled", cacheName: nil)
        controller.delegate = self
        self.taskController = controller
        
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
                if let cellDetail = tableView.cellForRow(at: indexPath) as? TaskCell {
                   configureTaskCell(cell: cellDetail, indexPath: indexPath as NSIndexPath)
                }
                
                if let cellTitle = tableView.cellForRow(at: indexPath) as? TaskCell {
                   configureTaskCell(cell: cellTitle, indexPath: indexPath as NSIndexPath)
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
