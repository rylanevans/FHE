//
//  PrepareDetails.swift
//  FHE
//
//  Created by Rylan Evans on 10/12/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class SongDetailVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, NSFetchedResultsControllerDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var manuallyAssignMemberImage: UIImageView!
    @IBOutlet weak var segment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clickSoundURL()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        attemptFetch()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        configureCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func configureCell(cell: SongCell, indexPath: NSIndexPath) {
        let song = controller.object(at: indexPath as IndexPath)
        cell.configureCell(song: song)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let sections = controller.sections {
            
            let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        return 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if let sections = controller.sections {
            return sections.count
        }
        return 0
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 150
//    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: Any) {
        playClick()
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
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
        manuallyAssignMemberImage.image = selectedImage
        
        // Dismiss the picker.
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Boiler Code for Core Data
    
    var controller: NSFetchedResultsController<Song>!
    
    func attemptFetch() {
        
        let fetchRequest: NSFetchRequest<Song> = Song.fetchRequest()
        let sortAssignmentOrder = NSSortDescriptor(key: "songAssignmentOrder", ascending: true)
        fetchRequest.sortDescriptors = [sortAssignmentOrder]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        
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
        let song = Song(context: context)
        song.songActive = true
        song.songAssignmentOrder = 1
//        song.songImage = UIImagePNGRepresentation(#imageLiteral(resourceName: "Song"))
        song.songSource = String(describing: SongSources.childrensSongBook)
        song.songNumber = "#200"
        song.songURL = "https://www.lds.org/music/library/hymns/the-spirit-of-god?lang=eng"
        song.songTitle = "The Spirit of God"
    }
}
