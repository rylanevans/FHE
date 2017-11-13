//
//  SongListTVC.swift
//  FHE
//
//  Created by Rylan Evans on 10/12/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SongListTVC: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate, SongCellDelegate {
    @IBOutlet weak var songAssigneeMemberImage: UIImageView!
    @IBOutlet weak var songAssigneeLabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var songAssigneeText: UITextField!
    
    let memberPicker = UIPickerView()
    
    var memberArray = ["Dad", "Mom", "Lilly", "Anisten", "Reed", "Claire"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        memberPicker.delegate = self
        memberPicker.dataSource = self
        memberPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)
        
        songAssigneeText.inputView = memberPicker
        songAssigneeText.inputAccessoryView = toolBar
        
        //        generatedTestSong()
        attemptFetch()
        tableView.reloadData()
    }
    
    @objc func donePressedOnKeyboard() {
        view.endEditing(true)
    }
    
    // MARK: - Picker View Set up
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let assignee = memberArray[row]
        return assignee
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return memberArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        songAssigneeLabel.text = memberArray[row]
        songAssigneeMemberImage.image = UIImage(named: "\(memberArray[row])")
        // save to member relationship to Song task to core data
    }
    
    
    // MARK: - Text Field Options
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    
    // MARK: - Table view data source
    
    // Title for header in section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
        var title = ""
        let sectionTitle = songController.sections
        
        if segment.selectedSegmentIndex == 0 {
            title = "SORTED BY DATE:"
            
        } else if segment.selectedSegmentIndex == 1 {
            title = "SORTED ALPHABETICALLY:"
            
        } else if segment.selectedSegmentIndex == 2 {
            switch sectionTitle![section].name {
            case "God Head": title = "GOD HEAD:"
            case "Plan of Salvation": title = "PLAN OF SALVATION:"
            case "Atonement": title = "ATONEMENT:"
            case "Christlike Attributes": title = "CHRISTLIKE ATTRIBUTES:"
            case "Commandments": title = "COMMANDMENTS:"
            case "Scriptures": title = "SCRIPTURES:"
            case "Restoration": title = "RESTORATION:"
            case "Principles & Ordinances": title = "PRINCIPLES & ORDINANCES:"
            case "Perfect the Saints": title = "PERFECT THE SAINTS:"
            case "Proclaim the Gospel": title = "PROCLAIM THE GOSPEL:"
            case "Redeem the Dead": title = "REDEEM THE DEAD:"
            case "Care for the Poor & Needy": title = "CARE FOR THE POOR & NEEDY:"
            default: title = "No Topic Selected"
            }
            
        } else if segment.selectedSegmentIndex == 3 {
            if sectionTitle![section].name == "Children's" {
                title = "CHILDREN'S SONG BOOK:"
            } else {
                title = "HYMN BOOK:"
            }
            
        } else if segment.selectedSegmentIndex == 4 {
            title = "DRAG & DROP TO SORT:"
            
        } else if segment.selectedSegmentIndex == 5 {
            if sectionTitle![section].name == "Children's" {
                title = "CHILDREN'S SONG BOOK:"
            } else {
                title = "HYMN BOOK:"
            }
            
        } else {
            title = "SORTED:"
        }
        
        let label = UILabel()
        label.text = title
        label.frame = CGRect(x: 15, y:5, width: 275, height: 25)
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
        if let sections = songController.sections {
            return sections.count
        }
        return 1
    }
    
    // Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = songController.sections {
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    // User did select row at a spesific index
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = songController.fetchedObjects, objects.count > 0 {
            let sections = songController.sections![indexPath.section]
            let song = sections.objects![indexPath.row]
            //            let song = objects[indexPath.row]
            performSegue(withIdentifier: "SongDetailsVCExisting", sender: song)
        }
    }
    
    // Function to configure each cell
    func configureCell(cell: SongCell, indexPath: NSIndexPath) {
        let song = songController.object(at: indexPath as IndexPath)
        cell.configureCell(song: song)
    }
    
    // Prepare for segue to another view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SongDetailsVCExisting" {
            if let destination = segue.destination as? SongDetailsVC {
                if let song = sender as? Song {
                    destination.songToEdit = song
                }
            }
        }
    }
    
    // MARK: - Title Table View Cell Delegate
    
    @IBAction func segmentChanged(_ sender: Any) {
        attemptFetch()
        tableView.reloadData()
    }
    
    @IBAction func recycleButtonPressed(_ sender: Any) {
        playClick()
    }
    
    func onDeckCellButtonTapped(_ sender: SongCell) {
        print("Testing ButtonTapped")
        //        guard let indexPath = tableView.indexPath(for: sender),
        //            let song = songController.object(at: indexPath) as? Song else {return}
        //        print("Button was pressed \(song)")
        //
        //        if let objects = songController.fetchedObjects, objects.count > 0 {
        //            let song = objects[indexPath.row]
        //        onDeckToggle(song)
        //        }
        //
        //        attemptFetch()
        //        tableView.reloadData()
    }
    
    //    func onDeckToggle(_ song: Song) {
    //        song.selected = !song.selected
    //        ad.saveContext()
    //        attemptFetch()
    //        tableView.reloadData()
    //    }
    
    // MARK: - Boiler Code for Core Data
    
    var songController: NSFetchedResultsController<Song>!
    
    func attemptFetch() {
        let fetchRequest: NSFetchRequest<Song> = Song.fetchRequest()
        
        let sortByDate = NSSortDescriptor(key: "dateCreated", ascending: false)
        let sortByTitle = NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedCaseInsensitiveCompare(_:)))
        let sortByTopic = NSSortDescriptor(key: "topic", ascending: true)
//        let sortByRandom = NSSortDescriptor(key: "random", ascending: true)
        let sortByOrder = NSSortDescriptor(key: "order", ascending: true)
        let sortByBook = NSSortDescriptor(key: "book", ascending: true)
        
        if segment.selectedSegmentIndex == 0 {
            fetchRequest.sortDescriptors = [sortByDate]
            
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            controller.delegate = self
            self.songController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else if segment.selectedSegmentIndex == 1 {
            fetchRequest.sortDescriptors = [sortByTitle]
            
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            controller.delegate = self
            self.songController = controller
            
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
            self.songController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else if segment.selectedSegmentIndex == 3 {
            fetchRequest.sortDescriptors = [sortByBook, sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "book", cacheName: nil)
            controller.delegate = self
            self.songController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else if segment.selectedSegmentIndex == 4 {
            fetchRequest.sortDescriptors = [sortByOrder]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            controller.delegate = self
            self.songController = controller
            
            do {
                try controller.performFetch()
            } catch {
                let error = error as NSError
                print("\(error)")
            }
            
        } else {
            fetchRequest.sortDescriptors = [sortByBook, sortByTitle]
            let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: "book", cacheName: nil)
            controller.delegate = self
            self.songController = controller
            
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
                let cell = tableView.cellForRow(at: indexPath) as! SongCell
                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
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
    
    func generatedTestSong() {
        let song1 = Song(context: context)
        song1.order = 1
        song1.random = Int64(arc4random_uniform(100))
        song1.book = songBooksArray[0]
        song1.number = "201"
        song1.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
        song1.title = "Nearer My God To Thee"
        song1.topic = "Atonement"
        song1.selected = true
        
        let song2 = Song(context: context)
        song2.order = 3
        song2.random = Int64(arc4random_uniform(100))
        song2.book = songBooksArray[1]
        song2.number = "86"
        song2.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
        song2.title = "A Poor Wayfaring Man of Grief"
        song2.topic = "God Head"
        song2.selected = false
        
        let song3 = Song(context: context)
        song3.order = 2
        song3.random = Int64(arc4random_uniform(100))
        song3.book = songBooksArray[0]
        song3.number = "57"
        song3.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
        song3.title = "High on the Mountain Top"
        song3.topic = "Perfect the Saints"
        song3.selected = false
        
        ad.saveContext()
    }
    
    func generatedTask() {
        let taskOpenPrayer = Task(context: context)
        taskOpenPrayer.assigned = false
        //        taskSongs.assignment = Member.Type???
        taskOpenPrayer.defaultNumber = 1
        taskOpenPrayer.enabled = true
        taskOpenPrayer.name = "Opening Prayer"
        taskOpenPrayer.order = Int64(arc4random_uniform(100))
        taskOpenPrayer.segment = 1
        
        let taskSongs = Task(context: context)
        taskSongs.assigned = false
        //        taskSongs.assignment = Member.Type???
        taskSongs.defaultNumber = 2
        taskSongs.enabled = true
        taskSongs.name = "Song"
        taskSongs.order = Int64(arc4random_uniform(100))
        taskSongs.segment = 1
        
        let taskRule = Task(context: context)
        taskRule.assigned = false
        //        taskRule.assignment = Member.Type???
        taskRule.defaultNumber = 3
        taskRule.enabled = false
        taskRule.name = "Rule"
        taskRule.order = Int64(arc4random_uniform(100))
        taskRule.segment = 1
        
        let taskScripture = Task(context: context)
        taskScripture.assigned = false
        //        taskScripture.assignment = Member.Type???
        taskScripture.defaultNumber = 4
        taskScripture.enabled = true
        taskScripture.name = "Scripture"
        taskScripture.order = Int64(arc4random_uniform(100))
        taskScripture.segment = 1
        
        let taskCalendar = Task(context: context)
        taskCalendar.assigned = false
        //        taskCalendar.assignment = Member.Type???
        taskCalendar.defaultNumber = 5
        taskCalendar.enabled = false
        taskCalendar.name = "Calendar"
        taskCalendar.order = Int64(arc4random_uniform(100))
        taskCalendar.segment = 1
        
        let taskTestimony = Task(context: context)
        taskTestimony.assigned = false
        //        taskTestimony.assignment = Member.Type???
        taskTestimony.defaultNumber = 6
        taskTestimony.enabled = true
        taskTestimony.name = "Testimony"
        taskTestimony.order = Int64(arc4random_uniform(100))
        taskTestimony.segment = 1
        
        let taskSpotlight = Task(context: context)
        taskSpotlight.assigned = false
        //        taskSpotlight.assignment = Member.Type???
        taskSpotlight.defaultNumber = 7
        taskSpotlight.enabled = false
        taskSpotlight.name = "Spotlight"
        taskSpotlight.order = Int64(arc4random_uniform(100))
        taskSpotlight.segment = 1
        
        let taskMisc = Task(context: context)
        taskMisc.assigned = false
        //        taskMisc.assignment = Member.Type???
        taskMisc.defaultNumber = 8
        taskMisc.enabled = false
        taskMisc.name = "Misc"
        taskMisc.order = Int64(arc4random_uniform(100))
        taskMisc.segment = 1
        
        let taskThought = Task(context: context)
        taskThought.assigned = false
        //        taskThought.assignment = Member.Type???
        taskThought.defaultNumber = 9
        taskThought.enabled = false
        taskThought.name = "Thought"
        taskThought.order = Int64(arc4random_uniform(100))
        taskThought.segment = 1
        
        let taskLesson = Task(context: context)
        taskLesson.assigned = false
        //        taskLesson.assignment = Member.Type???
        taskLesson.defaultNumber = 10
        taskLesson.enabled = true
        taskLesson.name = "Lesson"
        taskLesson.order = Int64(arc4random_uniform(100))
        taskLesson.segment = 1
        
        let taskCouncil = Task(context: context)
        taskCouncil.assigned = false
        //        taskCouncil.assignment = Member.Type???
        taskCouncil.defaultNumber = 11
        taskCouncil.enabled = false
        taskCouncil.name = "Council"
        taskCouncil.order = Int64(arc4random_uniform(100))
        taskCouncil.segment = 1
        
        let taskClosePrayer = Task(context: context)
        taskClosePrayer.assigned = false
        //        taskClosePrayer.assignment = Member.Type???
        taskClosePrayer.defaultNumber = 12
        taskClosePrayer.enabled = true
        taskClosePrayer.name = "Closing Prayer"
        taskClosePrayer.order = Int64(arc4random_uniform(100))
        taskClosePrayer.segment = 1
        
        let taskGame = Task(context: context)
        taskGame.assigned = false
        //        taskGame.assignment = Member.Type???
        taskGame.defaultNumber = 13
        taskGame.enabled = true
        taskGame.name = "Game"
        taskGame.order = Int64(arc4random_uniform(100))
        taskGame.segment = 1
        
        let taskTreat = Task(context: context)
        taskTreat.assigned = false
        //        taskTreat.assignment = Member.Type???
        taskTreat.defaultNumber = 14
        taskTreat.enabled = true
        taskTreat.name = "Treat"
        taskTreat.order = Int64(arc4random_uniform(100))
        taskTreat.segment = 1
        
        ad.saveContext()
    }
}
