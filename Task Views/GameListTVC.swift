//
//  GameListTVC.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData
import SafariServices

class GameListTVC: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate, GameCellDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var gameAssigneeMemberImage: UIImageView!
    @IBOutlet weak var gameAssigneeLabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var gameAssigneeText: UITextField!
    @IBOutlet weak var searchController: UISearchBar!
    
    let memberPicker = UIPickerView()
    
    let game = taskGame
    
    var gameURL = "https://www.churchofjesuschrist.org/music/library?lang=eng"
    
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
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        gameAssigneeText.inputView = memberPicker
        gameAssigneeText.inputAccessoryView = toolBar
        searchController.inputAccessoryView = toolBar
        
        let font = NSDictionary(object: UIFont(name: "American Typewriter", size: 15.0)!, forKey: NSAttributedString.Key.font as NSCopying)
        segment.setTitleTextAttributes(font as! [NSObject : Any] as? [NSAttributedString.Key : Any], for: .normal)
        
        offSoundURL()
        getAllTasks()
        segment.selectedSegmentIndex = Int(game.segment)
        getMembersForPicker()
        loadGameAssignmentImage()
        attemptFetch()
        getGames()
        tableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        let resetText = searchController
        resetText?.text = nil
        
        getAllTasks()
        segment.selectedSegmentIndex = Int(game.segment)
        getMembersForPicker()
        loadGameAssignmentImage()
        attemptFetch()
        getGames()
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
        let game = taskGame
        gameAssigneeMemberImage.image = assignee.photo as? UIImage
        gameAssigneeLabel.text = assignee.name
        if assignee.name == "Auto-Assign" {
            game.assigned = false
        } else {
            game.assigned = true
            game.assignment = assignee
        }
        runAssignments()
        ad.saveContext()
    }
    
    func loadGameAssignmentImage() {
        let game = taskGame
        let assignee = game.assignment
        if game.assigned == true {
            gameAssigneeMemberImage.image = assignee?.photo as? UIImage
            gameAssigneeLabel.text = assignee?.name
        } else {
            gameAssigneeMemberImage.image = #imageLiteral(resourceName: "Missing Profile")
            gameAssigneeLabel.text = "Auto-Assign"
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
        let sectionTitle = gameController.sections
        
        if segment.selectedSegmentIndex == 0 {
            switch sectionTitle![section].name {
            case "1": title = "1:"
            case "2": title = "2:"
            case "3": title = "3:"
            case "4": title = "4:"
            case "5": title = "5:"
            case "6": title = "6:"
            case "7": title = "7:"
            case "8": title = "8:"
            case "9": title = "9:"
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
            case "Other": title = "OTHER:"
            case "Classic": title = "CLASSIC:"
            case "Board Game": title = "BOARD GAME:"
            case "Cards": title = "CARDS:"
            case "Team Sport": title = "TEAM SPORTS:"
            case "Field Trip": title = "FIELD TRIP:"
            case "Outdoor": title = "OUTDOOR:"
            case "Service": title = "SERVICE:"
            case "Baking": title = "BAKING:"
            case "Crafts": title = "CRAFTS:"
            case "Mindfullness": title = "MINDFULNESS:"
            default: title = "SEARCH RESULTS:"
            }
            
        } else if segment.selectedSegmentIndex == 2 {
            switch sectionTitle![section].name {
            case "1": title = "FAVORITES:"
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
        if let sections = gameController.sections {
            return sections.count
        }
        return 0
    }
    
    // Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = gameController.sections {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath) as! GameCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        cell.delegate = self
        return cell
    }
    
    // User did select row at a spesific index
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = gameController.fetchedObjects, objects.count > 0 {
            let sections = gameController.sections![indexPath.section]
            let game = sections.objects![indexPath.row]
            //            let game = objects[indexPath.row]
            performSegue(withIdentifier: "GameDetailsVCExisting", sender: game)
        }
    }
    
    // Function to configure each cell
    func configureCell(cell: GameCell, indexPath: NSIndexPath) {
        let game = gameController.object(at: indexPath as IndexPath)
        cell.configureGameCell(game: game)
    }
    
    // Prepare for segue to another view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GameDetailsVCExisting" {
            if let destination = segue.destination as? GameDetailsVC {
                if let game = sender as? Game {
                    destination.gameToEdit = game
                }
            }
        }
    }
    
    // Segment changed in header
    @IBAction func segmentChanged(_ sender: Any) {
        let resetText = searchController
        let game = taskGame
        
        resetText?.text = nil
        game.segment = Int64(segment.selectedSegmentIndex)
        
        ad.saveContext()
        attemptFetch()
        tableView.reloadData()
    }
    
    // MARK: - Game Cell Delegate
    
    // What happens when game is selected
    func gameSelectedNeedsChanged(_ sender: GameCell) {
        let objects = gameController.fetchedObjects
        if let objects = objects, objects.count > 0 {
            let indexPath = tableView.indexPath(for: sender)
            let sections = gameController.sections![(indexPath?.section)!]
            let game = sections.objects![(indexPath?.row)!]
            
            unselectEverything()
            selectedValueToggle(game as! Game)
        }
    }
    
    func gamePreview(_ sender: GameCell) {
        let objects = gameController.fetchedObjects
        if let objects = objects, objects.count > 0 {
            let indexPath = tableView.indexPath(for: sender)
            let sections = gameController.sections![(indexPath?.section)!]
            let game = sections.objects![(indexPath?.row)!]
            
            previewGame(game as! Game)
        }
    }
    
    func previewGame(_ game: Game) {
        if let game = game.url {
            gameURL = game
        }
        
        let URL = NSURL(string: "\(gameURL)")!
        let gameWebVC = SFSafariViewController(url: URL as URL)
        gameWebVC.delegate = self
        
        present(gameWebVC, animated: true, completion: nil)
    }
    
    func unselectEverything() {
        for eachGame in gamesArray {
            eachGame.selected = false
            eachGame.selectedOne = nil
            ad.saveContext()
        }
    }
    
    // Change status of selected bool
    func selectedValueToggle(_ game: Game) {
        let task = taskGame
        game.selectedOne = task
        game.selected = true
        ad.saveContext()
        tableView.reloadData()
    }
    
    //Hide the searchbar
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchForGames()
        searchBar.resignFirstResponder()
    }
    
    //Text did chnage in search bar
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard !searchText.isEmpty else {
            attemptFetch()
            tableView.reloadData()
            return
        }
        
        searchForGames(segment: segment.selectedSegmentIndex, targetText: searchText)
        tableView.reloadData()
    }
    
    // MARK: - Boiler Code for Core Data
    
    var gameController: NSFetchedResultsController<Game>!
    
    // Fetch filtered game results
    func searchForGames(segment: Int?=nil, targetText: String?=nil){
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        
        let sortByTitle = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
        
        if targetText != nil {
            fetchRequest.sortDescriptors = [sortByTitle]
            let predicateTitle = NSPredicate(format: "title contains[c] %@", targetText!)
            let predicateCategory = NSPredicate(format: "category contains[c] %@", targetText!)
            let predicateCompound = NSCompoundPredicate(type: .or, subpredicates: [predicateTitle, predicateCategory])
            
            fetchRequest.predicate = predicateCompound
            //            fetchRequest.predicate = NSPredicate(format: "\(filterKeyword) contains[c] %@", targetText!)
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            controller.delegate = self
            self.gameController = controller
            
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
        let fetchRequest: NSFetchRequest<Game> = Game.fetchRequest()
        let sortByTitle = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
        let sortByCategory = NSSortDescriptor(key: "category", ascending: true)
        let sortByAlphabet = NSSortDescriptor(key: "alphabet", ascending: true)
        
        if segment.selectedSegmentIndex == 0 {
            fetchRequest.sortDescriptors = [sortByAlphabet, sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "alphabet", cacheName: nil)
            controller.delegate = self
            self.gameController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else if segment.selectedSegmentIndex == 1 {
            fetchRequest.sortDescriptors = [sortByCategory, sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "category", cacheName: nil)
            controller.delegate = self
            self.gameController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else if segment.selectedSegmentIndex == 2 {
            fetchRequest.sortDescriptors = [sortByTitle]
            let predicate = NSPredicate(format: "favorite == %@", NSNumber(booleanLiteral: true))
            fetchRequest.predicate = predicate
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "favorite", cacheName: nil)
            controller.delegate = self
            self.gameController = controller
            
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
            self.gameController = controller
            
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
                if let cell = tableView.cellForRow(at: indexPath) as? GameCell {
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
        @unknown default:
            fatalError("Error with unknown default")
        }
    }
}

extension GameListTVC: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
}

