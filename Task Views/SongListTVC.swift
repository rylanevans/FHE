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

class SongListTVC: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var songAssigneeMemberImage: UIImageView!
    @IBOutlet weak var songAssigneeLabel: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var memberPicker: UIPickerView!
    
    
    var memberArray = ["Dad", "Mom", "Lilly", "Anisten", "Reed", "Claire"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        
        memberPicker.delegate = self
        memberPicker.dataSource = self
        memberPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        
//        generatedTestSong()
        attemptFetch()
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
        //            assigneeText.text = memberArray[row]
    }
    
    
    // MARK: - Text Field Options
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    
    // MARK: - Table view data source
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let detailCell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        configureSongCell(cell: detailCell, indexPath: indexPath as NSIndexPath)
        return detailCell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = songController.sections {
            
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = songController.sections {
            return sections.count
        }
        return 0
    }
    
    func configureSongCell(cell: SongCell, indexPath: NSIndexPath) {
        let song = songController.object(at: indexPath as IndexPath)
        cell.configureSongCell(song: song)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let objects = songController.fetchedObjects, objects.count > 0 {
            let song = objects[indexPath.row]
            performSegue(withIdentifier: "SongDetailsVCExisting", sender: song)
        }
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
    
    @IBAction func selectMemberToAssign(_ sender: Any) {
        playClick()
    }
    
    // MARK: UIImagePickerControllerDelegate
    
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
    
    // MARK: - TitleTableViewCellDelegate
    

    @IBAction func segmentChanged(_ sender: Any) {
        playClick()
    // Tyring to save to CoreData with this action and fetch it when sorting through attemptFetch()

//        let sortBy = Task(context: context)
//        sortBy.sort = "order"
//        ad.saveContext()
//        tableView.reloadData()
    }
    
    // MARK: - Boiler Code for Core Data
    
    var songController: NSFetchedResultsController<Song>!
    
    func attemptFetch() {
    
        let fetchRequest: NSFetchRequest<Song> = Song.fetchRequest()
        
//        let sortByDate = NSSortDescriptor(key: "dateCreated", ascending: false)
        let sortByOrder = NSSortDescriptor(key: "order", ascending: true)
//        let sortByTitle = NSSortDescriptor(key: "title", ascending: true)
        fetchRequest.sortDescriptors = [sortByOrder]
        
//        if SongTitleCell.shared.segment.selectedSegmentIndex == 0 {
//            fetchRequest.sortDescriptors = [sortByDate]
//            print("Sort by Created")
//        } else if SongTitleCell.shared.segment.selectedSegmentIndex == 1 {
//            fetchRequest.sortDescriptors = [sortByTitle]
//            print("Sort by Title")
//        } else if SongTitleCell.shared.segment.selectedSegmentIndex == 2 {
//            fetchRequest.sortDescriptors = [sortByOrder]
//            print("Sort by Order")
//        } else {
//            fetchRequest.sortDescriptors = [sortByOrder]
//        }
        
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
                let cellDetail = tableView.cellForRow(at: indexPath) as! SongCell
                configureSongCell(cell: cellDetail, indexPath: indexPath as NSIndexPath)
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
        song1.order = 3
        song1.book = songBooksArray[0]
        song1.number = "201"
        song1.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
        song1.title = "Nearer My God To Thee"
        song1.topic = "Atonement"
        
        let song2 = Song(context: context)
        song2.order = 1
        song2.book = songBooksArray[1]
        song2.number = "86"
        song2.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
        song2.title = "A Poor Wayfaring Man of Grief"
        song2.topic = "God Head"
        
        let song3 = Song(context: context)
        song3.order = 2
        song3.book = songBooksArray[0]
        song3.number = "57"
        song3.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
        song3.title = "High on the Mountain Top"
        song3.topic = "Perfect the Saints"
        
        ad.saveContext()
    }
}
