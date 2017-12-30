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
        
        getAllTasks()
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
        
        getAllTasks()
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
        let scripture = taskScripture
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
        let scripture = taskScripture
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
            switch sectionTitle![section].name {
            case "A": title = "A:"
            case "B": title = "B:"
            case "C": title = "C:"
            case "D": title = "D:"
            case "E": title = "E:"
            case "F": title = "F:"
            case "G": title = "G:"
            case "H": title = "H:"
            case "I": title = "I:"
            case "J": title = "J:"
            case "K": title = "K:"
            case "L": title = "L:"
            case "M": title = "M:"
            case "N": title = "N:"
            case "O": title = "O:"
            case "P": title = "P:"
            case "Q": title = "Q:"
            case "R": title = "R:"
            case "S": title = "S:"
            case "T": title = "T:"
            case "U": title = "U:"
            case "V": title = "V:"
            case "W": title = "W:"
            case "X": title = "X:"
            case "Y": title = "Y:"
            case "Z": title = "Z:"
            default: title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 1 {
            switch sectionTitle![section].name {
            case "1-chr": title = "1 CHRONICLES:"
            case "1-kgs": title = "1 KINGS:"
            case "1 Samuel": title = "1 SAMUEL:"
            case "1-sam": title = "2 CHRONICLES:"
            case "2-kgs": title = "2 KINGS:"
            case "2-sam": title = "2 SAMUEL:"
            case "amos": title = "AMOS:"
            case "dan": title = "DANIEL:"
            case "deut": title = "DEUTERONOMY:"
            case "eccl": title = "ECCLESIASTES:"
            case "esth": title = "ESTHER:"
            case "ex": title = "EXODUS:"
            case "ezek": title = "EZEKIEL:"
            case "ezra": title = "EZRA:"
            case "gen": title = "GENESIS:"
            case "hab": title = "HABAKKUK:"
            case "hag": title = "HAGGAI:"
            case "hosea": title = "HOSEA:"
            case "isa": title = "ISAIAH:"
            case "jer": title = "JEREMIAH:"
            case "job": title = "JOB:"
            case "joel": title = "JOEL:"
            case "jonah": title = "JONEAH:"
            case "josh": title = "JOSHUA:"
            case "judg": title = "JUDGES:"
            case "lam": title = "LAMENTATIONS:"
            case "lev": title = "LEVITICUS:"
            case "mal": title = "MALACHI:"
            case "micah": title = "MICAH:"
            case "nahum": title = "NAHUM:"
            case "neh": title = "NEHEMIAH:"
            case "num": title = "NUMBERS:"
            case "obad": title = "OBADIAH:"
            case "prov": title = "PROVERBS:"
            case "ps": title = "PSALMS:"
            case "ruth": title = "RUTH:"
            case "song": title = "SOLOMAN'S SONG:"
            case "zech": title = "ZECHARIAH:"
            case "zeph": title = "ZEPHANIAH:"
            default: title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 2 {
            switch sectionTitle![section].name {
            case "1-cor": title = "1 CORINTHIANS:"
            case "1-jn": title = "1 JOHN:"
            case "1-pet": title = "1 PETER:"
            case "1-thes": title = "1 THESSALONIANS:"
            case "1-tim": title = "1 TIMOTHY:"
            case "2-cor": title = "2 CORINTHIANS:"
            case "2-jn": title = "2 JOHN:"
            case "2-pet": title = "2 PETER:"
            case "2-thes": title = "2 THESSALONIANS:"
            case "2 Timothy": title = "2 TIMOTHY:"
            case "3-jn": title = "3 JOHN:"
            case "acts": title = "ACTS:"
            case "col": title = "COLOSSIANS:"
            case "eph": title = "EPHESIANS:"
            case "gal": title = "GALATIANS:"
            case "heb": title = "HEBREWS:"
            case "james": title = "JAMES:"
            case "john": title = "JOHN:"
            case "jude": title = "JUDE:"
            case "luke": title = "LUKE:"
            case "mark": title = "MARK:"
            case "matt": title = "MATTHEW:"
            case "philem": title = "PHILEMON:"
            case "philip": title = "PHILIPPIANS:"
            case "rev": title = "REVELATION:"
            case "rom": title = "ROMANS:"
            case "titus": title = "TITUS:"
            default: title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 3 {
            switch sectionTitle![section].name {
            case "1-ne": title = "1 NEPHI:"
            case "2-ne": title = "2 NEPHI:"
            case "3-ne": title = "3 NEPHI:"
            case "4-ne": title = "4 NEPHI:"
            case "alma": title = "ALMA:"
            case "enos": title = "ENOS:"
            case "ether": title = "ETHER:"
            case "hel": title = "HELAMAN:"
            case "jacob": title = "JACOB:"
            case "jarom": title = "JAROM:"
            case "morm": title = "MORMON:"
            case "moro": title = "MORONI:"
            case "mosiah": title = "MOSIAH:"
            case "omni": title = "OMNI:"
            case "w-of-m": title = "WORDS OF MORMON:"
            default: title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 4 {
            switch sectionTitle![section].name {
            case "dc": title = "DOCTRINE AND COVENANTS:"
            default: title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 5 {
            switch sectionTitle![section].name {
            case "abr": title = "DOCTRINE AND COVENANTS:"
            case "a-of-f": title = "ARTICLES OF FAITH:"
            case "js-h": title = "JOSEPH SMITH HISTORY:"
            case "js-m": title = "JS - MATTHEW:"
            case "moses": title = "MOSES:"
            default: title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 6 {
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
            
        // sort by alphabet
        } else if segment.selectedSegmentIndex == 7 {
            switch sectionTitle![section].name {
            case "A": title = "A:"
            case "B": title = "B:"
            case "C": title = "C:"
            case "D": title = "D:"
            case "E": title = "E:"
            case "F": title = "F:"
            case "G": title = "G:"
            case "H": title = "H:"
            case "I": title = "I:"
            case "J": title = "J:"
            case "K": title = "K:"
            case "L": title = "L:"
            case "M": title = "M:"
            case "N": title = "N:"
            case "O": title = "O:"
            case "P": title = "P:"
            case "Q": title = "Q:"
            case "R": title = "R:"
            case "S": title = "S:"
            case "T": title = "T:"
            case "U": title = "U:"
            case "V": title = "V:"
            case "W": title = "W:"
            case "X": title = "X:"
            case "Y": title = "Y:"
            case "Z": title = "Z:"
            default: title = "SEARCH RESULTS:"
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
        let scripture = taskScripture
        
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
        let firstVerse = (scripture.verse?.components(separatedBy: "-")[0])!
        
        if scripture.volume != nil && scripture.book != nil && scripture.chapter != nil && scripture.verse != nil {
            let scripture = "https://www.lds.org/scriptures/\(scripture.volume!)/\(scripture.book!)/\(scripture.chapter!).\(scripture.verse!)?lang=eng#\(firstVerse)"
            scriptureURL = scripture
        }
        
        let URL = NSURL(string: "\(scriptureURL)")!
        let scriptureWebVC = SFSafariViewController(url: URL as URL)
        scriptureWebVC.delegate = self
        
        present(scriptureWebVC, animated: true, completion: nil)
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
        let task = taskScripture
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
            let predicateVolume = NSPredicate(format: "volume contains[c] %@", targetText!)
            let predicateBook = NSPredicate(format: "book contains[c] %@", targetText!)
            let predicateChapter = NSPredicate(format: "chapter contains[c] %@", targetText!)
            let predicateVerse = NSPredicate(format: "verse contains[c] %@", targetText!)
            let predicateTopic = NSPredicate(format: "topic contains[c] %@", targetText!)
            let predicateCompound = NSCompoundPredicate(type: .or, subpredicates: [predicateTitle, predicateTopic, predicateVolume, predicateBook, predicateChapter, predicateVerse])
            
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
        let sortByAlphabet = NSSortDescriptor(key: "alphabet", ascending: true)
        let sortByOrderNumber = NSSortDescriptor(key: "order", ascending: true)
        let sortByChapter = NSSortDescriptor(key: "chapter", ascending: true)
        
        // no filters sort alphabeticly
        if segment.selectedSegmentIndex == 0 {
            fetchRequest.sortDescriptors = [sortByAlphabet, sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "alphabet", cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        // filter by OT
        } else if segment.selectedSegmentIndex == 1 {
            fetchRequest.sortDescriptors = [sortByOrderNumber, sortByChapter]
            let predicate = NSPredicate(format: "volume == %@", "ot")
            fetchRequest.predicate = predicate
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "book", cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
        
        // filter by NT
        } else if segment.selectedSegmentIndex == 2 {
            fetchRequest.sortDescriptors = [sortByOrderNumber, sortByChapter]
            let predicate = NSPredicate(format: "volume == %@", "nt")
            fetchRequest.predicate = predicate
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "book", cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
        
        // filter by BOFM
        } else if segment.selectedSegmentIndex == 3 {
            fetchRequest.sortDescriptors = [sortByOrderNumber, sortByChapter]
            let predicate = NSPredicate(format: "volume == %@", "bofm")
            fetchRequest.predicate = predicate
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "book", cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        // filter by DC
        } else if segment.selectedSegmentIndex == 4 {
            fetchRequest.sortDescriptors = [sortByOrderNumber, sortByChapter]
            let predicate = NSPredicate(format: "volume == %@", "dc-testament")
            fetchRequest.predicate = predicate
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "book", cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        // filter by PGP
        } else if segment.selectedSegmentIndex == 5 {
            fetchRequest.sortDescriptors = [sortByOrderNumber, sortByChapter]
            let predicate = NSPredicate(format: "volume == %@", "pgp")
            fetchRequest.predicate = predicate
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "book", cacheName: nil)
            controller.delegate = self
            self.scriptureController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
        
        // sort by Topic
        } else if segment.selectedSegmentIndex == 6 {
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
            
        // filter by Favorites
        } else if segment.selectedSegmentIndex == 7 {
            fetchRequest.sortDescriptors = [sortByAlphabet, sortByTitle]
            let predicate = NSPredicate(format: "favorite == %@", NSNumber(booleanLiteral: true))
            fetchRequest.predicate = predicate
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "alphabet", cacheName: nil)
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

