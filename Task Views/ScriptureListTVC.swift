//
//  ScriptureListTVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import SafariServices

class ScriptureListTVC: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate, ScriptureCellDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var scriptureAssigneeMemberImage: UIImageView!
    @IBOutlet weak var scriptureAssigneeLabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var scriptureAssigneeText: UITextField!
    @IBOutlet weak var searchController: UISearchBar!
    
    let memberPicker = UIPickerView()
    
    let scripture = taskScripture
    
    var scriptureURL = "https://www.lds.org/scriptures?lang=eng"
    
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
        
        scriptureAssigneeText.inputView = memberPicker
        scriptureAssigneeText.inputAccessoryView = toolBar
        searchController.inputAccessoryView = toolBar
        
        let font = NSDictionary(object: UIFont(name: "American Typewriter", size: 15.0)!, forKey: NSAttributedStringKey.font as NSCopying)
        segment.setTitleTextAttributes(font as! [NSObject : Any], for: .normal)
        
        getTaskScripture()
        segment.selectedSegmentIndex = Int(scripture.segment)
        getMembersForPicker()
        loadScriptureAssignmentImage()
        attemptFetch()
        getScriptures()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let resetText = searchController
        resetText?.text = nil
        
        getTaskScripture()
        segment.selectedSegmentIndex = Int(scripture.segment)
        getMembersForPicker()
        loadScriptureAssignmentImage()
        attemptFetch()
        getScriptures()
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
        let scripture = taskScripturesArray[0]
        scriptureAssigneeMemberImage.image = assignee.photo as? UIImage
        scriptureAssigneeLabel.text = assignee.name
        scripture.assignment = assignee
        if assignee.name == "Auto-Assign" {
            scripture.assigned = false
        } else {
            scripture.assigned = true
        }
        ad.saveContext()
    }
    
    func loadScriptureAssignmentImage() {
        let scripture = taskScripturesArray[0]
        let assignee = scripture.assignment
        if scripture.assigned == true {
            scriptureAssigneeMemberImage.image = assignee?.photo as? UIImage
            scriptureAssigneeLabel.text = assignee?.name
        } else {
            scriptureAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            scriptureAssigneeLabel.text = "Auto-Assign"
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
        let sectionTitle = scriptureController.sections
        
        if segment.selectedSegmentIndex == 0 {
            if sectionTitle![section].name == "ot" {
                title = "OLD TESTAMENT:"
            } else if sectionTitle![section].name == "nt" {
                title = "NEW TESTAMENT:"
            } else if sectionTitle![section].name == "bofm" {
                title = "BOOK OF MORMON:"
            } else if sectionTitle![section].name == "dc" {
                title = "DOCTRINE & COVENANTS:"
            } else if sectionTitle![section].name == "pgp" {
                title = "PEARL OF GREAT PRICE:"
            } else {
                title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 1 {
            if sectionTitle![section].name == "Children's" {
                title = "CHILDREN'S SONG BOOK:"
            } else if sectionTitle![section].name == "Hymn" {
                title = "HYMN BOOK:"
            } else if sectionTitle![section].name == "Video" {
                title = "MUSIC VIDEO:"
            } else if sectionTitle![section].name == "Other" {
                title = "OTHER:"
            } else {
                title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 2 {
            switch sectionTitle![section].name {
            case "Heavenly Father": title = "HEAVENLY FATHER:"
            case "Jesus Christ": title = "JESUS CHRIST:"
            case "Holy Ghost": title = "HOLY GHOST:"
            case "Plan of Salvation": title = "PLAN OF SALVATION:"
            case "Birth of our Savior": title = "BIRTH OF OUR SAVIOR:"
            case "Atonement": title = "ATONEMENT:"
            case "Forgiveness": title = "FORGIVENESS:"
            case "Resurrection": title = "RESURRECTION:"
            case "Christlike Attributes": title = "CHRISTLIKE ATTRIBUTES:"
            case "Commandments": title = "COMMANDMENTS:"
            case "Scriptures": title = "SCRIPTURES:"
            case "Restoration": title = "RESTORATION:"
            case "Principles & Ordinances": title = "PRINCIPLES & ORDINANCES:"
            case "Endure to the end" : title = "ENDURE TO THE END:"
            case "Perfect the Saints": title = "PERFECT THE SAINTS:"
            case "Proclaim the Gospel": title = "PROCLAIM THE GOSPEL:"
            case "Redeem the Dead": title = "REDEEM THE DEAD:"
            case "Care for the Poor & Needy": title = "CARE FOR THE POOR & NEEDY:"
            case "Spiritual": title = "SPIRITUAL:"
            default: title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 3 {
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
        if let sections = scriptureController.sections {
            return sections.count
        }
        return 0
    }
    
    // Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = scriptureController.sections {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScriptureCell", for: indexPath) as! ScriptureCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        cell.delegate = self
        return cell
    }
    
    // User did select row at a spesific index
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = scriptureController.fetchedObjects, objects.count > 0 {
            let sections = scriptureController.sections![indexPath.section]
            let scripture = sections.objects![indexPath.row]
            //            let scripture = objects[indexPath.row]
            performSegue(withIdentifier: "ScriptureDetailsVCExisting", sender: scripture)
        }
    }
    
    // Function to configure each cell
    func configureCell(cell: ScriptureCell, indexPath: NSIndexPath) {
        let scripture = scriptureController.object(at: indexPath as IndexPath)
        cell.configureScriptureCell(scripture: scripture)
    }
    
    // Prepare for segue to another view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ScriptureDetailsVCExisting" {
            if let destination = segue.destination as? ScriptureDetailsVC {
                if let scripture = sender as? Scripture {
                    destination.scriptureToEdit = scripture
                }
            }
        }
    }
    
    // Segment changed in header
    @IBAction func segmentChanged(_ sender: Any) {
        let resetText = searchController
        let scripture = taskScripturesArray[0]
        
        resetText?.text = nil
        scripture.segment = Int64(segment.selectedSegmentIndex)
        
        ad.saveContext()
        attemptFetch()
        tableView.reloadData()
    }
    
    // MARK: - Scripture Cell Delegate
    
    // What happens when scripture is selected
    func scriptureSelectedNeedsChanged(_ sender: ScriptureCell) {
        let objects = scriptureController.fetchedObjects
        if let objects = objects, objects.count > 0 {
            let indexPath = tableView.indexPath(for: sender)
            let sections = scriptureController.sections![(indexPath?.section)!]
            let scripture = sections.objects![(indexPath?.row)!]
            
            unselectEverything()
            selectedValueToggle(scripture as! Scripture)
        }
    }
    
    func scripturePreview(_ sender: ScriptureCell) {
        let objects = scriptureController.fetchedObjects
        if let objects = objects, objects.count > 0 {
            let indexPath = tableView.indexPath(for: sender)
            let sections = scriptureController.sections![(indexPath?.section)!]
            let scripture = sections.objects![(indexPath?.row)!]
            
            previewScripture(scripture as! Scripture)
        }
    }
    
    func previewScripture(_ scripture: Scripture) {
//        if let scripture = scripture.url {
//            scriptureURL = scripture
        }
        
        let URL = NSURL(string: "\(scriptureURL)")!
        let scriptureWebVC = SFSafariViewController(url: URL as URL)
        scriptureWebVC.delegate = self
        
        present(scriptureWebVC, animated: true, completion: nil)
    }
    
    func searchScripture(segment: Int?=nil, targetText: String?=nil){
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        
        let sortByName = NSSortDescriptor(key: "name", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
        
        if targetText != nil {
            fetchRequest.sortDescriptors = [sortByName]
            let predicateName = NSPredicate(format: "name contains[c] %@", targetText!)
            
            fetchRequest.predicate = predicateName
            
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            controller.delegate = self
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
        }
    }
    
    func unselectEverything() {
        for eachScripture in scripturesArray {
            eachScripture.selected = false
            eachScripture.selectedOne = nil
            ad.saveContext()
        }
    }
    
    // Change status of selected bool
    func selectedValueToggle(_ scripture: Scripture) {
        let task = taskScripturesArray[0]
        scripture.selectedOne = task
        scripture.selected = true
        ad.saveContext()
        tableView.reloadData()
    }
    
    //Hide the searchbar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchForScriptures()
        searchBar.resignFirstResponder()
    }
    
    //Text did chnage in search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            attemptFetch()
            tableView.reloadData()
            return
        }
        
        searchForScriptures(segment: segment.selectedSegmentIndex, targetText: searchText)
        tableView.reloadData()
    }
    
    // MARK: - Boiler Code for Core Data
    
    var scriptureController: NSFetchedResultsController<Scripture>!
    
    // Fetch filtered scripture results
    func searchForScriptures(segment: Int?=nil, targetText: String?=nil){
        let fetchRequest: NSFetchRequest<Scripture> = Scripture.fetchRequest()
        
        let sortByTitle = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
        
        if targetText != nil {
            fetchRequest.sortDescriptors = [sortByTitle]
            let predicateTitle = NSPredicate(format: "title contains[c] %@", targetText!)
            let predicateNumber = NSPredicate(format: "number contains[c] %@", targetText!)
            let predicateTopic = NSPredicate(format: "topic contains[c] %@", targetText!)
            let predicateFavorite = NSPredicate(format: "favorite contains[c] %@", targetText!)
            let predicateCompound = NSCompoundPredicate(type: .or, subpredicates: [predicateTitle, predicateNumber, predicateTopic, predicateFavorite])
            
            fetchRequest.predicate = predicateCompound
            //            fetchRequest.predicate = NSPredicate(format: "\(filterKeyword) contains[c] %@", targetText!)
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
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
        let fetchRequest: NSFetchRequest<Scripture> = Scripture.fetchRequest()
        let sortByTitle = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
        let sortByTopic = NSSortDescriptor(key: "topic", ascending: true)
        let sortByBook = NSSortDescriptor(key: "book", ascending: true)
        let sortByNumber = NSSortDescriptor(key: "number", ascending: true)
        let sortByFavorite = NSSortDescriptor(key: "favorite", ascending: false)
        
        if segment.selectedSegmentIndex == 0 {
            fetchRequest.sortDescriptors = [sortByBook, sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "book", cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else if segment.selectedSegmentIndex == 1 {
            fetchRequest.sortDescriptors = [sortByBook, sortByNumber]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "book", cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else if segment.selectedSegmentIndex == 2 {
            fetchRequest.sortDescriptors = [sortByTopic, sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "topic", cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else if segment.selectedSegmentIndex == 3 {
            fetchRequest.sortDescriptors = [sortByFavorite, sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "favorite", cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
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
            self.scriptureController = controller
            
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
                if let cell = tableView.cellForRow(at: indexPath) as? ScriptureCell {
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

extension ScriptureListTVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

