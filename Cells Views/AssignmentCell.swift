//
//  AssignmentCell.swift
//  FHE
//
//  Created by Rylan Evans on 11/14/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import CoreData

protocol AssignmentCellDelegate {
    func assignmentNeedsChanged(_ sender: AssignmentCell)
}

class AssignmentCell: UITableViewCell, UIPickerViewDelegate, UIPickerViewDataSource, NSFetchedResultsControllerDelegate {
    @IBOutlet weak var taskImage: UIImageView!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var memberImage: UIImageView!
    
    @IBOutlet weak var memberAssigneeText: UITextField!
    
    var delegate: AssignmentCellDelegate?
    
    let memberPicker = UIPickerView()
    var memberArray = [Member]()
    var songTask = [Task]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
        memberPicker.delegate = self
        memberPicker.dataSource = self
        memberPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)

        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.sizeToFit()
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
        toolBar.setItems([flexibleSpace, doneButton], animated: false)

        memberAssigneeText.inputView = memberPicker
        memberAssigneeText.inputAccessoryView = toolBar
        
        getMembers()
        getTaskSong()
    }

     // MARK: - Picker View Set up

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let assignee = memberArray[row]
        return assignee.name
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return memberArray.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let assignee = memberArray[row]
        let song = songTask[0]
        memberImage.image = assignee.photo as? UIImage
        memberNameLabel.text = assignee.name
        song.assignment = assignee
        song.assigned = true
        ad.saveContext()
        
//        memberNameLabel.text = memberArray[row]
//        if memberArray[row] == "Auto-Assign" {
//            memberImage.image = #imageLiteral(resourceName: "Missing Profile")
//        } else {
//            memberImage.image = UIImage(named: "\(memberArray[row])")
//            // save to member relationship to Song task to core data
//        }
    }
    
     // MARK: - Text Field Options
    
     //Hide the keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func donePressedOnKeyboard() {
        self.endEditing(true)
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func assignmentImagePressed(_ sender: Any) {
        delegate?.assignmentNeedsChanged(self)
    }
    
    func configureAssignmentCell(task: Task) {
        assignmentTask(task: task)
//        assignmentMember(member: member)
    }
    
    func assignmentTask(task: Task) {
        let taskName = task.name ?? ""
        let image = task.image ?? #imageLiteral(resourceName: "NoPhoto")
        let songSelected = task.selected?.title ?? "Title of task"
        let photo = task.assignment?.photo ?? #imageLiteral(resourceName: "Missing Profile")
        let name = task.assignment?.name ?? "Assignee"
        taskImage.image = image as? UIImage
        taskNameLabel.text = taskName
        taskTitleLabel.text = songSelected
        memberNameLabel.text = name
        memberImage.image = photo as? UIImage
    }
    
    func assignmentMember(member: Member) {
        let name = member.name ?? ""
        let photo = member.photo ?? #imageLiteral(resourceName: "NoPhoto")
        memberNameLabel.text = name
        memberImage.image = photo as? UIImage
    }
    
    // Fetch members and put into an array
    func getMembers() {
        let fetchRequest: NSFetchRequest<Member> = Member.fetchRequest()
        let predicate = NSPredicate(format: "attending == %@", NSNumber(booleanLiteral: true))
        fetchRequest.predicate = predicate
        let sortByAge = NSSortDescriptor(key: "age", ascending: true)
        fetchRequest.sortDescriptors = [sortByAge]
        
        do {
            self.memberArray = try context.fetch(fetchRequest)
            self.memberPicker.reloadAllComponents()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
    
    // Fetch task song to assign if needed
    func getTaskSong() {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let predicate = NSPredicate(format: "name == %@", "Song")
        fetchRequest.predicate = predicate
        
        do {
            self.songTask = try context.fetch(fetchRequest)
        } catch {
            let error = error as NSError
            print("\(error)")
        }
    }
}

