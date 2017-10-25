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

class FamilyTVC: UITableViewController, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate, MemberTitleCellDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.4755483866, blue: 0.9911283851, alpha: 1),
            NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
            
            self.hideKeyboardWhenTappedAround()
        
            //        generatedTestMember()
            memberAttemptFetch()
        }
        
        // MARK: - Text Field Options
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            // Hide the keyboard.
            textField.resignFirstResponder()
            return true
        }
    
        
        // MARK: - Table view data source
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.item == 0 {
                let titleCell = tableView.dequeueReusableCell(withIdentifier: "MemberTitleCell", for: indexPath) as! MemberTitleCell
                configureMemberTitleCell(cell: titleCell, indexPath: indexPath as NSIndexPath)
                return titleCell
            } else {
                let detailCell = tableView.dequeueReusableCell(withIdentifier: "MemberDetailCell", for: indexPath) as! MemberDetailCell
                configureMemberDetailCell(cell: detailCell, indexPath: indexPath as NSIndexPath)
                return detailCell
            }
        }
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            if let sections = memberController.sections {
                
                let sectionInfo = sections[section]
                return sectionInfo.numberOfObjects
            }
            return 0
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            if let sections = memberController.sections {
                return sections.count
            }
            return 0
        }
        
        func configureMemberTitleCell(cell: MemberTitleCell, indexPath: NSIndexPath) {
            let member = memberController.object(at: indexPath as IndexPath)
            cell.configureMemberTitleCell(member: member)
        }
        
        func configureMemberDetailCell(cell: MemberDetailCell, indexPath: NSIndexPath) {
            let member = memberController.object(at: indexPath as IndexPath)
            cell.configureMemberDetailCell(member: member)
        }
        
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let objects = memberController.fetchedObjects, objects.count > 0 {
                let member = objects[indexPath.row]
                performSegue(withIdentifier: "MemberDetailsVCExisting", sender: member)
            }
        }
        
//        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "MemberDetailsVCExisting" {
//                if let destination = segue.destination as? FamilyDetailsVC {
//                    if let member = sender as? Member {
//                        destination.memberToEdit = member
//                    }
//                }
//            }
//        }
    
        // MARK: - TitleTableViewCellDelegate
        
        func segmentChanged(_ sender: MemberTitleCell) {
            // Tyring to save to CoreData with this action and fetch it when sorting through memberAttemptFetch()
            
            //        let sortBy = Task(context: context)
            //        sortBy.sort = "order"
            //        ad.saveContext()
            //        tableView.reloadData()
        }
        
        // MARK: - Boiler Code for Core Data
        
        var memberController: NSFetchedResultsController<Member>!
        
        func memberAttemptFetch() {
            
            let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
            
            let sortByDate = NSSortDescriptor(key: "dateCreated", ascending: false)
            let sortByOrder = NSSortDescriptor(key: "order", ascending: true)
            let sortByTitle = NSSortDescriptor(key: "title", ascending: true)
            fetchRequest.sortDescriptors = [sortByOrder]
            
            //        if MemberTitleCell.shared.segment.selectedSegmentIndex == 0 {
            //            fetchRequest.sortDescriptors = [sortByDate]
            //            print("Sort by Created")
            //        } else if MemberTitleCell.shared.segment.selectedSegmentIndex == 1 {
            //            fetchRequest.sortDescriptors = [sortByTitle]
            //            print("Sort by Title")
            //        } else if MemberTitleCell.shared.segment.selectedSegmentIndex == 2 {
            //            fetchRequest.sortDescriptors = [sortByOrder]
            //            print("Sort by Order")
            //        } else {
            //            fetchRequest.sortDescriptors = [sortByOrder]
            //        }
            
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            
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
        
        func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
            
            switch(type){
                
            case.insert:
                if let indexPath = newIndexPath {
                    tableView.insertRows(at: [indexPath], with: .fade)
                }
                break
            case.delete:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                break
            case.update:
                if let indexPath = indexPath {
                    let cellDetail = tableView.cellForRow(at: indexPath) as! MemberDetailCell
                    configureMemberDetailCell(cell: cellDetail, indexPath: indexPath as NSIndexPath)
                    
                    let cellTitle = tableView.cellForRow(at: indexPath) as! MemberTitleCell
                    configureMemberTitleCell(cell: cellTitle, indexPath: indexPath as NSIndexPath)
                }
                break
            case.move:
                if let indexPath = indexPath {
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }
                if let indexPath = newIndexPath {
                    tableView.insertRows(at: [indexPath], with: .fade)
                }
                break
            }
        }
        
        func generatedTestMember() {
            let member1 = Member(context: context)
            member1.name = "Dad"
//            member1.photo = #imageLiteral(resourceName: "Dad")
            member1.attending = true
            
            ad.saveContext()
        }
}
