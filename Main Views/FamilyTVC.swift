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

class FamilyTVC: UITableViewController, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.4755483866, blue: 0.9911283851, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!]
        
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
        label.frame = CGRect(x: 15, y:25, width: 200, height: 25)
        label.font = UIFont(name: "American Typewriter-Bold", size: 25)
        view.addSubview(label)
        
        return view
    }
    
    // Header height
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    // Number of sections
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = memberController.sections {
            return sections.count
        }
        return 1
    }
    
    // Number of rows in section
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        let attendingSection = memberController.sections![section]
//        return attendingSection.numberOfObjects
//    }
    
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
//            let members = memberController.fetchedObjects![indexPath.row]
            let member = sections.objects![indexPath.row]
            performSegue(withIdentifier: "MemberDetailsVCExisting", sender: member)
        }
    }
    
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let objects = memberController.fetchedObjects, objects.count > 0 {
//            let member = objects[indexPath.row]
//            performSegue(withIdentifier: "MemberDetailsVCExisting", sender: member)
//        }
//    }
    
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
    
    
    // MARK: - Title Table View Cell Delegate
    
    @IBAction func segmentChanged(_ sender: Any) {
        memberAttemptFetch()
        tableView.reloadData()
        viewDidLoad()
        viewWillAppear(true)
    }
    
    @IBAction func recycleButtonPressed(_ sender: Any) {
        playClick()
    }
    
    // MARK: - Boiler Code for Core Data
    
    var memberController: NSFetchedResultsController<Member>!
    
    func memberAttemptFetch() {
        
        let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
        
        let sortByDate = NSSortDescriptor(key: "dateCreated", ascending: false)
        let sortByAge = NSSortDescriptor(key: "age", ascending: true)
        let sortByName = NSSortDescriptor(key: "name", ascending: true)
        let sortByAttending = NSSortDescriptor(key: "attending", ascending: false)
        let sortByOrder = NSSortDescriptor(key: "order", ascending: true)
        let sortByRandom = NSSortDescriptor(key: "random", ascending: true)
        
        
        if segment.selectedSegmentIndex == 0 {
            fetchRequest.sortDescriptors = [sortByAttending, sortByDate]
        } else if segment.selectedSegmentIndex == 1 {
            fetchRequest.sortDescriptors = [sortByAttending, sortByAge]
        } else if segment.selectedSegmentIndex == 2 {
            fetchRequest.sortDescriptors = [sortByAttending, sortByName]
        } else if segment.selectedSegmentIndex == 3 {
            fetchRequest.sortDescriptors = [sortByAttending, sortByRandom]
        } else if segment.selectedSegmentIndex == 4 {
            fetchRequest.sortDescriptors = [sortByAttending, sortByOrder]
        } else {
            fetchRequest.sortDescriptors = [sortByAttending, sortByOrder]
        }
        
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
                let cellDetail = tableView.cellForRow(at: indexPath) as! FamilyCell
                configureFamilyCell(cell: cellDetail, indexPath: indexPath as NSIndexPath)
                
                let cellTitle = tableView.cellForRow(at: indexPath) as! FamilyCell
                configureFamilyCell(cell: cellTitle, indexPath: indexPath as NSIndexPath)
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
    
    func generatedTestMember() {
        
        let member5 = Member(context: context)
        member5.name = "Claire"
        member5.photo = #imageLiteral(resourceName: "Claire") as UIImage
        member5.attending = true
        member5.order = 5
        member5.age = 5
        member5.random = Int64(arc4random_uniform(100))
        
        let member4 = Member(context: context)
        member4.name = "Reed"
        member4.photo = #imageLiteral(resourceName: "Reed") as UIImage
        member4.attending = true
        member4.order = 4
        member4.age = 7
        member4.random = Int64(arc4random_uniform(100))
        
        let member3 = Member(context: context)
        member3.name = "Anisten"
        member3.photo = #imageLiteral(resourceName: "Anisten") as UIImage
        member3.attending = true
        member3.order = 3
        member3.age = 10
        member3.random = Int64(arc4random_uniform(100))
        
        let member2 = Member(context: context)
        member2.name = "Lilly"
        member2.photo = #imageLiteral(resourceName: "Lilly") as UIImage
        member2.attending = true
        member2.order = 2
        member2.age = 12
        member2.random = Int64(arc4random_uniform(100))
        
        let member1 = Member(context: context)
        member1.name = "Mom"
        member1.photo = #imageLiteral(resourceName: "Mom") as UIImage
        member1.attending = true
        member1.order = 1
        member1.age = 35
        member1.random = Int64(arc4random_uniform(100))
        
        let member0 = Member(context: context)
        member0.name = "Dad"
        member0.photo = #imageLiteral(resourceName: "Dad") as UIImage
        member0.attending = true
        member0.order = 0
        member0.age = 38
        member0.random = Int64(arc4random_uniform(100))
        
        let member6 = Member(context: context)
        member6.name = "Papa"
        member6.photo = #imageLiteral(resourceName: "Papa") as UIImage
        member6.attending = false
        member6.order = 6
        member6.age = 50
        member6.random = Int64(arc4random_uniform(100))
        
        let member7 = Member(context: context)
        member7.name = "Grammy"
        member7.photo = #imageLiteral(resourceName: "Grammy") as UIImage
        member7.attending = false
        member7.order = 7
        member7.age = 45
        member7.random = Int64(arc4random_uniform(100))
        
        ad.saveContext()
    }
}
