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
    @IBOutlet weak var manualOrAutoLabel: UILabel!
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var memberAssigneeText: UITextField!
    
    var delegate: AssignmentCellDelegate?
    
    let memberPicker = UIPickerView()
    
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
        
        getMembersForPicker()
        getAllTasks()
        getMembersAttending()
        getTaskPrayer()
        getTaskSong()
    }

     // MARK: - Picker View Set up

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let pickerMembers = membersPickerArray[row]
        return pickerMembers.name
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return membersPickerArray.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let assignee = membersPickerArray[row]
        let song = taskSong
        memberImage.image = assignee.photo as? UIImage
        memberNameLabel.text = assignee.name
        song.assignment = assignee
        song.assigned = true
        ad.saveContext()
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
        let taskName = task.name ?? ""
        let image = task.image ?? #imageLiteral(resourceName: "NoPhoto")
        let photo = task.assignment?.photo ?? #imageLiteral(resourceName: "Missing Profile")
        let name = task.assignment?.name ?? "Assignee"
        var selected = ""
        
        switch task.name {
        case "Opening Prayer"?: selected = (task.selectedPrayer?.title)!
        case "Song"?: selected = (task.selectedSong?.title)!
        case "Rule"?: selected = (task.selectedRule?.title)!
        case "Scripture"?: selected = (task.selectedScripture?.title)!
        case "Calendar"?: selected = (task.selectedCalendar?.title)!
        case "Testimony"?: selected = (task.selectedTestimony?.title)!
        case "Spotlight"?: selected = (task.selectedSpotlight?.title)!
        case "Misc"?: selected = (task.selectedMisc?.title)!
        case "Thought"?: selected = (task.selectedThought?.title)!
        case "Lesson"?: selected = (task.selectedLesson?.title)!
        case "Counsil"?: selected = (task.selectedCouncil?.title)!
        case "Activity"?: selected = (task.selectedGame?.title)!
//        case "Closing Prayer"?: selected = (task.selectedPrayer?.title)!
//        case "Treat"?: selected = (task.selectedTreat?.title)!
        default: selected = "Title of task"
        }
        
        let autoAssigned = task.assigned
        if autoAssigned == true {
            manualOrAutoLabel.text = "Manual"
        } else {
            manualOrAutoLabel.text = "Auto"
        }
        
        taskImage.image = image as? UIImage
        taskNameLabel.text = taskName
        taskTitleLabel.text = selected
        memberNameLabel.text = name
        memberImage.image = photo as? UIImage
    }
}

