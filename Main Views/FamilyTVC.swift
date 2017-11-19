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
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.4755483866, blue: 0.9911283851, alpha: 1), NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!]
        
        self.hideKeyboardWhenTappedAround()
        
//        generateFamilyMembers()
        memberAttemptFetch()
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
    
    // Segment changed in header
    @IBAction func segmentChanged(_ sender: Any) {
        memberAttemptFetch()
        tableView.reloadData()
        viewDidLoad()
        viewWillAppear(true)
    }
    
    // Rotate through songs
    @IBAction func recycleButtonPressed(_ sender: Any) {
        playClick()
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
        
        let sortByDate = NSSortDescriptor(key: "dateCreated", ascending: false)
        let sortByAge = NSSortDescriptor(key: "age", ascending: true)
        let sortByName = NSSortDescriptor(key: "name", ascending: true)
        let sortByAttending = NSSortDescriptor(key: "attending", ascending: false)
        let sortByRandom = NSSortDescriptor(key: "random", ascending: true)
        let sortByOrder = NSSortDescriptor(key: "order", ascending: true)
        
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
            
        case .insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case .delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case .update:
            if let indexPath = indexPath {
                let cellDetail = tableView.cellForRow(at: indexPath) as! FamilyCell
                configureFamilyCell(cell: cellDetail, indexPath: indexPath as NSIndexPath)
                
                let cellTitle = tableView.cellForRow(at: indexPath) as! FamilyCell
                configureFamilyCell(cell: cellTitle, indexPath: indexPath as NSIndexPath)
            }
            break
        case .move:
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
            tableView.deleteSections(IndexSet(integer: sectionIndex), with: .fade)
        case .insert:
            tableView.insertSections(IndexSet(integer: sectionIndex), with: .fade)
        default:
            break
        }
    }
    
    func generateFamilyMembers() {
        let memberDad = Member(context: context)
        memberDad.name = "Dad"
        memberDad.age = 38
        memberDad.attending = true
        memberDad.order = 1
        memberDad.photo = #imageLiteral(resourceName: "Dad") as UIImage
        memberDad.random = Int64(arc4random_uniform(100))
        
        let memberMom = Member(context: context)
        memberMom.name = "Dad"
        memberMom.age = 36
        memberMom.attending = true
        memberMom.order = 2
        memberMom.photo = #imageLiteral(resourceName: "Mom") as UIImage
        memberMom.random = Int64(arc4random_uniform(100))
        
        let memberLilly = Member(context: context)
        memberLilly.name = "Lilly"
        memberLilly.age = 12
        memberLilly.attending = true
        memberLilly.order = 3
        memberLilly.photo = #imageLiteral(resourceName: "Lilly") as UIImage
        memberLilly.random = Int64(arc4random_uniform(100))
        
        let memberAnisten = Member(context: context)
        memberAnisten.name = "Anisten"
        memberAnisten.age = 10
        memberAnisten.attending = true
        memberAnisten.order = 4
        memberAnisten.photo = #imageLiteral(resourceName: "Anisten") as UIImage
        memberAnisten.random = Int64(arc4random_uniform(100))
        
        let memberReed = Member(context: context)
        memberReed.name = "Reed"
        memberReed.age = 8
        memberReed.attending = true
        memberReed.order = 5
        memberReed.photo = #imageLiteral(resourceName: "Reed") as UIImage
        memberReed.random = Int64(arc4random_uniform(100))
        
        let memberClaire = Member(context: context)
        memberClaire.name = "Claire"
        memberClaire.age = 5
        memberClaire.attending = true
        memberClaire.order = 6
        memberClaire.photo = #imageLiteral(resourceName: "Claire") as UIImage
        memberClaire.random = Int64(arc4random_uniform(100))
        
        let memberPapa = Member(context: context)
        memberPapa.name = "Papa"
        memberPapa.age = 60
        memberPapa.attending = false
        memberPapa.order = 7
        memberPapa.photo = #imageLiteral(resourceName: "Papa") as UIImage
        memberPapa.random = Int64(arc4random_uniform(100))
        
        let memberGrammy = Member(context: context)
        memberGrammy.name = "Grammy"
        memberGrammy.age = 55
        memberGrammy.attending = false
        memberGrammy.order = 8
        memberGrammy.photo = #imageLiteral(resourceName: "Grammy") as UIImage
        memberGrammy.random = Int64(arc4random_uniform(100))
        
        let memberGuest = Member(context: context)
        memberGuest.name = "Guest"
        memberGuest.age = 100
        memberGuest.attending = false
        memberGuest.order = 9
        memberGuest.photo = #imageLiteral(resourceName: "Missing Profile") as UIImage
        memberGuest.random = Int64(arc4random_uniform(100))
        
        ad.saveContext()
    }
}
