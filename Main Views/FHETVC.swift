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
    
    var member: Member?
    var task: Task?
    var tasks = [Task]()
    
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.clickSoundURL()
//        assignmentTableView.reloadData()
        assignmentTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    @IBAction func editButtonPressed(_ sender: Any) {
        self.tabBarController?.selectedIndex = 0
    }
    
    @IBAction func refreshAssignmentsButtonPressed(_ sender: Any) {
        playClick()
    }
    
    @IBAction func beginButtonPressed(_ sender: Any) {
        playClick()
        let appReviewPresentedRandom = arc4random_uniform(4)
        if appReviewPresentedRandom == UInt32(1) {
//        if launchedCounter % 2 == 0 {
            SKStoreReviewController.requestReview()
        }
    }
    
    // Number of rows in section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
        //        return tasks.count
    }
    
    // Height for each row
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    // Congigure each cell for row at a spesific index
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = assignmentTableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = "Something"
        return cell
//        let detailCell = assignmentTableView.dequeueReusableCell(withIdentifier: "AssignmentCell", for: indexPath) as! AssignmentCell
//        configureAssignmentCell(cell: detailCell, indexPath: indexPath as NSIndexPath)
//        detailCell.delegate = self
//        return detailCell
    }
    
    // Function to configure each cell
//    func configureAssignmentCell(cell: AssignmentCell, indexPath: NSIndexPath) {
//        let task = taskController.object(at: indexPath as IndexPath)
//        let member = memberController.object(at: indexPath as IndexPath)
//        cell.configureAssignmentCell(task: task, member: member)
//    }
    
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
    
    func assignmentNeedsChanged(_ sender: AssignmentCell) {
        print("Assignment Needs Changed")
        
//        if let objects = memberController.fetchedObjects, objects.count > 0 {
//            let indexPath = tableView.indexPath(for: sender)
//            let sections = memberController.sections![(indexPath?.section)!]
//            let member = sections.objects![(indexPath?.row)!]
//            attendingValueToggle(member as! Member)
//        }
    }
    
    // MARK: - Boiler Code for Core Data
    
//    var taskController: NSFetchedResultsController<Task>!
//    var memberController: NSFetchedResultsController<Member>!
//    
//    func memberTaskAttemptFetch() {
//        let taskfetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
////        let memberfetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
//        
//        let sortByEnabled = NSSortDescriptor(key: "enabled", ascending: true)
//        let sortByNumber = NSSortDescriptor(key: "defaultNumber", ascending: true)
//
//        taskfetchRequest.sortDescriptors = [sortByEnabled, sortByNumber]
//        
//        let controller = NSFetchedResultsController(fetchRequest: taskfetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//        controller.delegate = self
//        self.taskController = controller
//        
//        do {
//            try controller.performFetch()
//        } catch {
//            let error = error as NSError
//            print("\(error)")
//        }
//    }
//    
//    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        assignmentTableView.beginUpdates()
//    }
//    
//    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        assignmentTableView.endUpdates()
//    }
    
    // Object did change
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//
//        switch(type){
//
//        case .insert:
//            if let indexPath = newIndexPath {
//                assignmentTableView.insertRows(at: [indexPath], with: .fade)
//            }
//            break
//        case .delete:
//            if let indexPath = indexPath {
//                assignmentTableView.deleteRows(at: [indexPath], with: .fade)
//            }
//            break
//        case .update:
//            if let indexPath = indexPath {
//                let cellDetail = assignmentTableView.cellForRow(at: indexPath) as! AssignmentCell
//                configureAssignmentCell(cell: cellDetail, indexPath: indexPath as NSIndexPath)
//
//                let cellTitle = assignmentTableView.cellForRow(at: indexPath) as! AssignmentCell
//                configureAssignmentCell(cell: cellTitle, indexPath: indexPath as NSIndexPath)
//            }
//            break
//        case .move:
//            if let indexPath = indexPath {
//                assignmentTableView.deleteRows(at: [indexPath], with: .fade)
//            }
//            if let indexPath = newIndexPath {
//                assignmentTableView.insertRows(at: [indexPath], with: .fade)
//            }
//            break
//        }
//    }
}

