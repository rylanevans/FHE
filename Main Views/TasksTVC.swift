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

class TasksTVC: UITableViewController, NSFetchedResultsControllerDelegate, TaskCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.4755483866, blue: 0.9911283851, alpha: 1),
            NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
        
        clickSoundURL()
        
        taskAttemptFetch()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let presentRandom = arc4random_uniform(11)
        if presentRandom == UInt32(1) {
            //        if launchedCounter % 3 == 0 {
            performSegue(withIdentifier: "AboutMe", sender: nil)
        }
        
        taskAttemptFetch()
        tableView.reloadData()
    }
    
    //    func toggleSwitch() {
    //        if (sender.isOn == true) {
    //            output.text = "Yes! It is on."
    //        } else {
    //            output.text = "No. It is off."
    //        }
    //    }
    
    
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
            //            let task = taskController.fetchedObjects![indexPath.row]
            performSegue(withIdentifier: "ShowSongs", sender: task)
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
        ad.saveContext()
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
            break
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case .update:
            if let indexPath = indexPath {
                let cellDetail = tableView.cellForRow(at: indexPath) as! TaskCell
                configureTaskCell(cell: cellDetail, indexPath: indexPath as NSIndexPath)
                
                let cellTitle = tableView.cellForRow(at: indexPath) as! TaskCell
                configureTaskCell(cell: cellTitle, indexPath: indexPath as NSIndexPath)
            }
            break
        case .move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
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
