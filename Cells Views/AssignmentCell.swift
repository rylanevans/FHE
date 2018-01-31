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
    func assignmentNeedsChanged(_ sender: AssignmentCell, _ assignee: Member)
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
        
        taskTitleLabel.setBottomBorder()
        manualOrAutoLabel.setBottomBorder()
        
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
        getMembersAttending()
        getAllTasks()
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
        memberImage.image = assignee.photo as? UIImage
        memberNameLabel.text = assignee.name
        delegate?.assignmentNeedsChanged(self, assignee)
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
    
    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func configureAssignmentCell(task: Task) {
        let taskName = task.name ?? " "
        let image = task.image ?? #imageLiteral(resourceName: "NoPhoto")
        let photo = task.assignment?.photo ?? #imageLiteral(resourceName: "Missing Profile")
        let name = task.assignment?.name ?? "Assignee"
        var selectedName = " "
        
        switch taskName {
        case "Opening Prayer": selectedName = (task.selectedPrayer?.title) ?? "No Prayer selected"
        case "Song": selectedName = "✓\(task.selectedSong?.title ?? "No Song selected")"
        case "Rule": selectedName = "✓\(task.selectedRule?.title ?? "No Rule selected")"
        case "Scripture": selectedName = "✓\(task.selectedScripture?.title ?? "No Scripture selected")"
        case "Calendar": selectedName = (task.selectedCalendar?.title) ?? "No Calendar selected"
        case "Testimony": selectedName = (task.selectedTestimony?.title) ?? "No Testimony selected"
        case "Spotlight": selectedName = (task.selectedSpotlight?.title) ?? "No Spotlight selected"
        case "Thought": selectedName = (task.selectedThought?.title) ?? "No Thought selected"
        case "Quote": selectedName = "✓\(task.selectedQuote?.title ?? "No Quote selected")"
        case "Lesson": selectedName = "✓\(task.selectedLesson?.title ?? "No Lesson selected")"
        case "Council": selectedName = (task.selectedCouncil?.title) ?? "No Council selected"
        case "Activity": selectedName = "✓\(task.selectedGame?.title ?? "No Activity selected")"
        case "Closing Prayer": selectedName = (task.selectedClosing?.title) ?? "No Prayer selected"
        case "Treat": selectedName = "✓\(task.selectedTreat?.title ?? "No Treat selected")"
        default: selectedName = "No Task Selected"
        }
        
        let autoAssigned = task.assigned
        if autoAssigned == true {
            manualOrAutoLabel.text = "Manual"
        } else {
            manualOrAutoLabel.text = "Auto"
        }
        
        taskImage.image = image as? UIImage
        taskNameLabel.text = taskName
        taskTitleLabel.text = selectedName
        memberNameLabel.text = name
        memberImage.image = photo as? UIImage
    }
}

