//
//  RuleListTVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import SafariServices

class RuleListTVC: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate, RuleCellDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var ruleAssigneeMemberImage: UIImageView!
    @IBOutlet weak var ruleAssigneeLabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var ruleAssigneeText: UITextField!
    @IBOutlet weak var searchController: UISearchBar!
    
    let memberPicker = UIPickerView()
    
    let rule = taskRule
    
    var ruleURL = "https://drive.google.com/file/d/0B7Bm33sKVSSqSnBFblFHUGU4NVk/view?usp=sharing"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        searchController.barTintColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        searchController.layer.borderWidth = 1
        searchController.layer.borderColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        searchController.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.9372549057, blue: 0.9568627477, alpha: 1)
        
        memberPicker.delegate = self
        memberPicker.dataSource = self
        searchController.delegate = self
        
        memberPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        ruleAssigneeText.inputView = memberPicker
        ruleAssigneeText.inputAccessoryView = toolBar
        searchController.inputAccessoryView = toolBar
        
        let font = NSDictionary(object: UIFont(name: "American Typewriter", size: 15.0)!, forKey: NSAttributedStringKey.font as NSCopying)
        segment.setTitleTextAttributes(font as! [NSObject : Any], for: .normal)
        
        getTaskRule()
        segment.selectedSegmentIndex = Int(rule.segment)
        getMembersForPicker()
        loadRuleAssignmentImage()
        attemptFetch()
        getRules()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let resetText = searchController
        resetText?.text = nil
        
        getTaskRule()
        segment.selectedSegmentIndex = Int(rule.segment)
        getMembersForPicker()
        loadRuleAssignmentImage()
        attemptFetch()
        getRules()
        tableView.reloadData()
    }
    
    // MARK: - Picker View Set up
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let assignee = membersPickerArray[row]
        return assignee.name
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return membersPickerArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let assignee = membersPickerArray[row]
        let rule = taskRulesArray[0]
        ruleAssigneeMemberImage.image = assignee.photo as? UIImage
        ruleAssigneeLabel.text = assignee.name
        rule.assignment = assignee
        if assignee.name == "Auto-Assign" {
            rule.assigned = false
        } else {
            rule.assigned = true
        }
        ad.saveContext()
    }
    
    func loadRuleAssignmentImage() {
        let rule = taskRulesArray[0]
        let assignee = rule.assignment
        if rule.assigned == true {
            ruleAssigneeMemberImage.image = assignee?.photo as? UIImage
            ruleAssigneeLabel.text = assignee?.name
        } else {
            ruleAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            ruleAssigneeLabel.text = "Auto-Assign"
        }
    }
    
    // MARK: - Text Field Options
    
    // Hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func donePressedOnKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Table view data source
    
    // Title for header in section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        
        var title = ""
        let sectionTitle = ruleController.sections
        
        if segment.selectedSegmentIndex == 0 {
            if sectionTitle![section].name == "" {
                title = "SORTED ALPHABETICALLY:"
            } else {
                title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 1 {
            if sectionTitle![section].name == "" {
                title = "SORTED BY DATE ADDED:"
            } else {
                title = "SEARCH RESULTS:"
            }

        } else if segment.selectedSegmentIndex == 2 {
            if Int(sectionTitle![section].name) == 1 {
                title = "FAVORITES:"
            } else if Int(sectionTitle![section].name) == 0 {
                title = "NON-FAVORITES:"
            } else {
                title = "SEARCH RESULTS:"
            }
            
        } else {
            title = "SORTED:"
        }
        
        let label = UILabel()
        label.text = title
        label.frame = CGRect(x: 15, y:5, width: 275, height: 25)
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
        if let sections = ruleController.sections {
            return sections.count
        }
        return 0
    }
    
    // Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = ruleController.sections {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "RuleCell", for: indexPath) as! RuleCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        cell.delegate = self
        return cell
    }
    
    // User did select row at a spesific index
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = ruleController.fetchedObjects, objects.count > 0 {
            let sections = ruleController.sections![indexPath.section]
            let rule = sections.objects![indexPath.row]
            //            let rule = objects[indexPath.row]
            performSegue(withIdentifier: "RuleDetailsVCExisting", sender: rule)
        }
    }
    
    // Function to configure each cell
    func configureCell(cell: RuleCell, indexPath: NSIndexPath) {
        let rule = ruleController.object(at: indexPath as IndexPath)
        cell.configureRuleCell(rule: rule)
    }
    
    // Prepare for segue to another view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "RuleDetailsVCExisting" {
            if let destination = segue.destination as? RuleDetailsVC {
                if let rule = sender as? Rule {
                    destination.ruleToEdit = rule
                }
            }
        }
    }
    
    // Segment changed in header
    @IBAction func segmentChanged(_ sender: Any) {
        let resetText = searchController
        let rule = taskRulesArray[0]
        
        resetText?.text = nil
        rule.segment = Int64(segment.selectedSegmentIndex)
        
        ad.saveContext()
        attemptFetch()
        tableView.reloadData()
    }
    
    // MARK: - Rule Cell Delegate
    
    // What happens when rule is selected
    func ruleSelectedNeedsChanged(_ sender: RuleCell) {
        let objects = ruleController.fetchedObjects
        if let objects = objects, objects.count > 0 {
            let indexPath = tableView.indexPath(for: sender)
            let sections = ruleController.sections![(indexPath?.section)!]
            let rule = sections.objects![(indexPath?.row)!]
            
            unselectEverything()
            selectedValueToggle(rule as! Rule)
        }
    }
    
    func rulePreview(_ sender: RuleCell) {
        let objects = ruleController.fetchedObjects
        if let objects = objects, objects.count > 0 {
            let indexPath = tableView.indexPath(for: sender)
            let sections = ruleController.sections![(indexPath?.section)!]
            let rule = sections.objects![(indexPath?.row)!]
            
            previewRule(rule as! Rule)
        }
    }
    
    func previewRule(_ rule: Rule) {
        if let rule = rule.url {
            ruleURL = rule
        }
        
        let URL = NSURL(string: "\(ruleURL)")!
        let ruleWebVC = SFSafariViewController(url: URL as URL)
        ruleWebVC.delegate = self
        
        present(ruleWebVC, animated: true, completion: nil)
    }
    
    func unselectEverything() {
        for eachRule in rulesArray {
            eachRule.selected = false
            eachRule.selectedOne = nil
            ad.saveContext()
        }
    }
    
    // Change status of selected bool
    func selectedValueToggle(_ rule: Rule) {
        let task = taskRulesArray[0]
        rule.selectedOne = task
        rule.selected = true
        ad.saveContext()
        tableView.reloadData()
    }
    
    //Hide the searchbar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchForRules()
        searchBar.resignFirstResponder()
    }
    
    //Text did chnage in search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            attemptFetch()
            tableView.reloadData()
            return
        }
        
        searchForRules(segment: segment.selectedSegmentIndex, targetText: searchText)
        tableView.reloadData()
    }
    
    // MARK: - Boiler Code for Core Data
    
    var ruleController: NSFetchedResultsController<Rule>!
    
    // Fetch filtered rule results
    func searchForRules(segment: Int?=nil, targetText: String?=nil){
        let fetchRequest: NSFetchRequest<Rule> = Rule.fetchRequest()
        
        let sortByTitle = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
        
        if targetText != nil {
            fetchRequest.sortDescriptors = [sortByTitle]
            let predicateTitle = NSPredicate(format: "title contains[c] %@", targetText!)
            let predicateDetail = NSPredicate(format: "detail contains[c] %@", targetText!)
            let predicateFavorite = NSPredicate(format: "favorite contains[c] %@", targetText!)
            let predicateCompound = NSCompoundPredicate(type: .or, subpredicates: [predicateTitle, predicateDetail, predicateFavorite])
            
            fetchRequest.predicate = predicateCompound
            //            fetchRequest.predicate = NSPredicate(format: "\(filterKeyword) contains[c] %@", targetText!)
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            controller.delegate = self
            self.ruleController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
        }
    }
    
    // Fetch all data for table view
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<Rule> = Rule.fetchRequest()
        let sortByTitle = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
        let sortByDate = NSSortDescriptor(key: "dateCreated", ascending: true)
        let sortByFavorite = NSSortDescriptor(key: "favorite", ascending: false)
        
        if segment.selectedSegmentIndex == 0 {
            fetchRequest.sortDescriptors = [sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            controller.delegate = self
            self.ruleController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else if segment.selectedSegmentIndex == 1 {
            fetchRequest.sortDescriptors = [sortByDate, sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "dateCreated", cacheName: nil)
            controller.delegate = self
            self.ruleController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else if segment.selectedSegmentIndex == 2 {
            fetchRequest.sortDescriptors = [sortByFavorite, sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "favorite", cacheName: nil)
            controller.delegate = self
            self.ruleController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else {
            fetchRequest.sortDescriptors = [sortByTitle]
            
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            controller.delegate = self
            self.ruleController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
        }
    }
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        // Something is broke when I filter with search and try and deselect everything and then save it. There is a conflict when something changed and my filters that contain %@.
        tableView.endUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch(type){
            
        case.insert:
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
            break
        case.delete:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            break
        case.update:
            if let indexPath = indexPath {
                if let cell = tableView.cellForRow(at: indexPath) as? RuleCell {
                    configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
                }
            }
            break
        case.move:
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .automatic)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .automatic)
            }
            break
        }
    }
}

extension RuleListTVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}
