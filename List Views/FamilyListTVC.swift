////
////  FamilyListTVC.swift
////  FHE
////
////  Created by Rylan Evans on 10/17/17.
////  Copyright © 2017 Rylan Evans. All rights reserved.
////
//
////
////  PrepareDetails.swift
////  FHE
////
////  Created by Rylan Evans on 10/12/17.
////  Copyright © 2017 Rylan Evans. All rights reserved.
////
//
//import Foundation
//import UIKit
//import CoreData
//
//class SongListTVC: UITableViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate {
//    
//    //    @IBOutlet weak var tableView: UITableView!
//    @IBOutlet weak var manuallyAssignMemberImage: UIImageView!
//    @IBOutlet weak var segment: UISegmentedControl!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        clickSoundURL()
//        
//        tableView.delegate = self
//        tableView.dataSource = self
//        
//        //        generatedTestSong()
//        attemptFetch()
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
//        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
//        return cell
//    }
//    
//    func configureCell(cell: SongCell, indexPath: NSIndexPath) {
//        let song = controller.object(at: indexPath as IndexPath)
//        cell.configureCell(song: song)
//    }
//    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if let objects = controller.fetchedObjects, objects.count > 0 {
//            let song = objects[indexPath.row]
//            performSegue(withIdentifier: "SongDetailsVCExisting", sender: song)
//        }
//    }
//    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "SongDetailsVCExisting" {
//            if let destination = segue.destination as? SongDetailsVC {
//                if let song = sender as? Song {
//                    destination.songToEdit = song
//                }
//            }
//        }
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if let sections = controller.sections {
//            
//            let sectionInfo = sections[section]
//            return sectionInfo.numberOfObjects
//        }
//        return 0
//    }
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        if let sections = controller.sections {
//            return sections.count
//        }
//        return 0
//    }
//    
//    @IBAction func selectImageFromPhotoLibrary(_ sender: Any) {
//        playClick()
//        
//        let imagePickerController = UIImagePickerController()
//        imagePickerController.sourceType = .photoLibrary
//        imagePickerController.delegate = self
//        
//        present(imagePickerController, animated: true, completion: nil)
//    }
//    
//    // MARK: UIImagePickerControllerDelegate
//    
//    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//        // Dismiss the picker if the user canceled.
//        dismiss(animated: true, completion: nil)
//    }
//    
//    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        // The info dictionary contains multiple representations of the image, and this uses the original.
//        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
//        
//        // Set photoImageView to display the selected image.
//        manuallyAssignMemberImage.image = selectedImage
//        
//        // Dismiss the picker.
//        dismiss(animated: true, completion: nil)
//    }
//    
//    // MARK: - Boiler Code for Core Data
//    
//    var controller: NSFetchedResultsController<Song>!
//    
//    func attemptFetch() {
//        
//        let fetchRequest: NSFetchRequest<Song> = Song.fetchRequest()
//        
//        //        let sortByDate = NSSortDescriptor(key: "songDateCreated", ascending: false)
//        //        fetchRequest.sortDescriptors = [sortByDate]
//        
//        let sortOrder = NSSortDescriptor(key: "order", ascending: true)
//        fetchRequest.sortDescriptors = [sortOrder]
//        
//        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//        
//        controller.delegate = self
//        
//        self.controller = controller
//        
//        do {
//            try controller.performFetch()
//        } catch {
//            let error = error as NSError
//            print("\(error)")
//        }
//    }
//    
//    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableView.beginUpdates()
//    }
//    
//    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
//        tableView.endUpdates()
//    }
//    
//    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
//        
//        switch(type){
//            
//        case.insert:
//            if let indexPath = newIndexPath {
//                tableView.insertRows(at: [indexPath], with: .fade)
//            }
//            break
//        case.delete:
//            if let indexPath = indexPath {
//                tableView.deleteRows(at: [indexPath], with: .fade)
//            }
//            break
//        case.update:
//            if let indexPath = indexPath {
//                let cell = tableView.cellForRow(at: indexPath) as! SongCell
//                configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
//            }
//            break
//        case.move:
//            if let indexPath = indexPath {
//                tableView.deleteRows(at: [indexPath], with: .fade)
//            }
//            if let indexPath = newIndexPath {
//                tableView.insertRows(at: [indexPath], with: .fade)
//            }
//            break
//        }
//    }
//    
//    func generatedTestSong() {
//        let song1 = Song(context: context)
//        song1.order = 3
//        song1.book = songBooksArray[0]
//        song1.number = "#201"
//        song1.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
//        song1.title = "Song 1"
//        
//        let song2 = Song(context: context)
//        song2.order = 1
//        song2.book = songBooksArray[1]
//        song2.number = "#202"
//        song2.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
//        song2.title = "Song 2"
//        
//        let song3 = Song(context: context)
//        song3.order = 2
//        song3.book = songBooksArray[0]
//        song3.number = "#203"
//        song3.url = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
//        song3.title = "Song 3"
//        
//        //        ad.saveContext()
//    }
//}
//
