//
//  FHETVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/21/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import StoreKit
import CoreData

class FHETVC: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate, AssignmentCellDelegate {
    @IBOutlet weak var christTeachingImage: UIImageView!
    @IBOutlet weak var assignmentTableView: UITableView!
    
    //    var member: Member?
    //    var task: Task?
    //    var tasks = [Task]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.006879295688, green: 0.4784864783, blue: 0.9987255931, alpha: 1),
            NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
        
        self.clickSoundURL()
        getMembersForPicker()
        getMembersAttending()
        getAllTasks()
        taskAttemptFetch()
        assignmentTableView.reloadData()
        runTutorial()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getMembersForPicker()
        getMembersAttending()
        getAllTasks()
        if counter.launched % 4 == 0 && counter.tipGiven == false && counter.hideAboutMe == false {
            counter.hideAboutMe = true
            ad.saveContext()
            performSegue(withIdentifier: "AboutMe", sender: nil)
        }
        assignmentTableView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    func runTutorial() {
        if counter.homeTip == false {
            counter.homeTip = true
            ad.saveContext()
            let alertController = UIAlertController(title: "📌 TIPS & TRICKS", message: "\nTRICK - Anything in orange text or an orange image is a button or a link to something. Try it out!\n\nTIP - The “✓” in front of the task Title means there are multiple choices and that's the one you selected.\n\nTIP - When you are ready with the selected tasks and desired assignments press the “BEGIN” button to start your family meeting.", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
                (action : UIAlertAction!) -> Void in
            })
            
            alertController.addAction(okAction)
            alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        playClick()
        
        let alertController = UIAlertController(title: "⚠️ INACTIVE BUTTON", message: "This button will auto-assign all family members to enabled tasks but I don't have it working yet.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func refreshAssignmentsButtonPressed(_ sender: Any) {
        playClick()
        
        let alertController = UIAlertController(title: "⚠️ INACTIVE BUTTON", message: "This button will rotate through any tasks set to auto-assignment but I don't have it working yet.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "👌 Got it!", style: .default, handler: {
            (action : UIAlertAction!) -> Void in
        })
        
        alertController.addAction(okAction)
        alertController.view.tintColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func beginButtonPressed(_ sender: Any) {
        playClick()
        print("\(counter)")
        //        let appReviewPresentedRandom = arc4random_uniform(3)
        //        if appReviewPresentedRandom == UInt32(1) {
        if counter.launched > 3 && counter.launched % 2 == 0 {
            SKStoreReviewController.requestReview()
        }
    }
    
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = taskController.sections {
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return tasksEnabledArray.count
    }
    
    // Height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    // Congigure each cell for row at a spesific index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailCell = assignmentTableView.dequeueReusableCell(withIdentifier: "AssignmentCell", for: indexPath) as! AssignmentCell
        configureAssignmentCell(cell: detailCell, indexPath: indexPath as NSIndexPath)
        detailCell.delegate = self
        return detailCell
    }
    
    // User did select row at a spesific index
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = taskController.fetchedObjects, objects.count > 0 {
            let sections = taskController.sections![indexPath.section]
            let task = sections.objects![indexPath.row]
            let segueTask: Task = task as! Task
            switch segueTask.name {
            case "Opening Prayer"?: performSegue(withIdentifier: "ShowPrayer", sender: task)
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
            case "Treat"?: performSegue(withIdentifier: "ShowTreats", sender: task)
            default: performSegue(withIdentifier: "ShowPrayer", sender: task)
            }
        }
    }
    
    // Function to configure each cell
    func configureAssignmentCell(cell: AssignmentCell, indexPath: NSIndexPath) {
        let task = taskController.object(at: indexPath as IndexPath)
        //        let member = memberController.object(at: indexPath as IndexPath)
        cell.configureAssignmentCell(task: task)
    }
    
    // User did select row at a spesific index
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        if let objects = taskController.fetchedObjects, objects.count > 0 {
    //            let sections = taskController.sections![indexPath.section]
    //            let member = sections.objects![indexPath.row]
    //            //            let members = memberController.fetchedObjects![indexPath.row]
    //            performSegue(withIdentifier: "MemberDetailsVCExisting", sender: member)
    //        }
    //    }
    
    // MARK: - Assignment Cell Delegate
    
    func assignmentNeedsChanged(_ sender: AssignmentCell, _ assignee: Member) {
        if let objects = taskController.fetchedObjects, objects.count > 0 {
            let indexPath = assignmentTableView.indexPath(for: sender)
            let sections = taskController.sections![(indexPath?.section)!]
            let task = sections.objects![(indexPath?.row)!]
            assignedMemberChanged(task as! Task, assignee)
        }
    }
    
    func assignedMemberChanged(_ task: Task, _ assignee: Member) {
        let specificTask = task
        let specificMember = assignee
        if assignee.name == "Auto-Assign" {
            specificTask.assigned = false
        } else {
            specificTask.assigned = true
            specificTask.assignment = specificMember
            
            ad.saveContext()
        }
    }
    
    // MARK: - Boiler Code for Core Data
    
    var taskController: NSFetchedResultsController<Task>!
    
    func taskAttemptFetch() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let predicate = NSPredicate(format: "enabled == %@", NSNumber(booleanLiteral: true))
        fetchRequest.predicate = predicate
        let sortByDefaultNumber = NSSortDescriptor(key: "defaultNumber", ascending: true)
        fetchRequest.sortDescriptors = [sortByDefaultNumber]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
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
        assignmentTableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        assignmentTableView.endUpdates()
    }
    
    // Object did change
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type){
            
        case .insert:
            if let indexPath = newIndexPath {
                assignmentTableView.insertRows(at: [indexPath], with: .automatic)
            }
            break
        case .delete:
            if let indexPath = indexPath {
                assignmentTableView.deleteRows(at: [indexPath], with: .automatic)
            }
            break
        case .update:
            if let indexPath = indexPath {
                if let cellDetail = assignmentTableView.cellForRow(at: indexPath) as? AssignmentCell {
                    configureAssignmentCell(cell: cellDetail, indexPath: indexPath as NSIndexPath)
                }
                
                if let cellTitle = assignmentTableView.cellForRow(at: indexPath) as? AssignmentCell {
                    configureAssignmentCell(cell: cellTitle, indexPath: indexPath as NSIndexPath)
                }
            }
            break
        case .move:
            if let indexPath = indexPath {
                assignmentTableView.deleteRows(at: [indexPath], with: .automatic)
            }
            if let indexPath = newIndexPath {
                assignmentTableView.insertRows(at: [indexPath], with: .automatic)
            }
            break
        }
    }
}

