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

class FamilyTVC: UITableViewController, NSFetchedResultsControllerDelegate {
    
    var fetchedResultsController: NSFetchedResultsController<Member>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic
        self.navigationController?.navigationBar.largeTitleTextAttributes = [
            NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0, green: 0.4755483866, blue: 0.9911283851, alpha: 1),
            NSAttributedStringKey.font: UIFont(name: "Noteworthy-Bold", size: 35)!
        ]
        self.clickSoundURL()

    }
    
    
    
    @IBAction func addMemberButtonPressed(_ sender: Any) {

    }
    
    
    //     MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }
    
//    func attemptFetch() {
//        let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
//
//        let ageSort = NSSortDescriptor(key: "memberAge", ascending: true)
//        fetchRequest.sortDescriptors[ageSort]
//        
//        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: <#T##NSManagedObjectContext#>, sectionNameKeyPath: <#T##String?#>, cacheName: <#T##String?#>)
//    }
}
