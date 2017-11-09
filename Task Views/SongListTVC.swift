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
    @IBOutlet weak var memberPicker: UIPickerView!
    @IBOutlet weak var songAssigneeText: UITextField!
    
    var memberArray = ["Dad", "Mom", "Lilly", "Anisten", "Reed", "Claire"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        memberPicker.delegate = self
        memberPicker.dataSource = self
        memberPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
        songAssigneeText.inputView = memberPicker
        
//        generatedTestSong()
        attemptFetch()
        tableView.reloadData()
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = songController.sections {
            return sections.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = songController.sections {
            
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = songController.fetchedObjects, objects.count > 0 {
            let song = objects[indexPath.row]
            performSegue(withIdentifier: "SongDetailsVCExisting", sender: song)
        }
    }
    
    func configureCell(cell: SongCell, indexPath: NSIndexPath) {
        let song = songController.object(at: indexPath as IndexPath)
        cell.configureCell(song: song)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SongDetailsVCExisting" {
            if let destination = segue.destination as? SongDetailsVC {
                if let song = sender as? Song {
                    destination.songToEdit = song
                }
            }
        }
    }
    
    
    // MARK: Image Picker Controller Delegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // Dismiss the picker if the user canceled.
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        // The info dictionary contains multiple representations of the image, and this uses the original.
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        // Set photoImageView to display the selected image.
        songAssigneeMemberImage.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
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
        let sortByOrder = NSSortDescriptor(key: "order", ascending: true)

        if segment.selectedSegmentIndex == 0 {
            fetchRequest.sortDescriptors = [sortByDate]

        } else if segment.selectedSegmentIndex == 1 {
            fetchRequest.sortDescriptors = [sortByTitle]
        } else if segment.selectedSegmentIndex == 2 {
            fetchRequest.sortDescriptors = [sortByTopic]
        } else {
            fetchRequest.sortDescriptors = [sortByOrder]
        }
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        controller.delegate = self
        
        self.songController = controller
        
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
        song1.book = songBooksArray[0]
        song1.number = "201"
        song1.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
        song1.title = "Nearer My God To Thee"
        song1.topic = "Atonement"
        song1.selected = true
        
        let song2 = Song(context: context)
        song2.order = 3
        song2.book = songBooksArray[1]
        song2.number = "86"
        song2.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
        song2.title = "A Poor Wayfaring Man of Grief"
        song2.topic = "God Head"
        song2.selected = false
        
        let song3 = Song(context: context)
        song3.order = 2
        song3.book = songBooksArray[0]
        song3.number = "57"
        song3.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
        song3.title = "High on the Mountain Top"
        song3.topic = "Perfect the Saints"
        song3.selected = false
        
        ad.saveContext()
    }
}
