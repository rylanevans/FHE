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

class FamilyTVC: UITableViewController, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate, FamilyCellDelegate {
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.006879295688, green: 0.4784864783, blue: 0.9987255931, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!]
        
        self.hideKeyboardWhenTappedAround()
        
        memberAttemptFetch()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    // MARK: - Text Field Options
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    
    // MARK: - Table view data source
    
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
    
    // MARK: - Family Cell Delegate
    
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
