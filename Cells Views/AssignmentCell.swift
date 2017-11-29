//
//  AssignmentCell.swift
//  FHE
//
//  Created by Rylan Evans on 11/14/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

protocol AssignmentCellDelegate {
    func assignmentNeedsChanged(_ sender: AssignmentCell)
}

class AssignmentCell: UITableViewCell { //, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var taskImage: UIImageView!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskTitleLabel: UILabel!
    @IBOutlet weak var memberNameLabel: UILabel!
    @IBOutlet weak var memberImage: UIImageView!
    
    @IBOutlet weak var memberAssigneeText: UITextField!
    
    var delegate: AssignmentCellDelegate?
    
//    let memberPicker = UIPickerView()
    
//    var members = [Member]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        memberPicker.delegate = self
//        memberPicker.dataSource = self
//        memberPicker.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
//
//        let toolBar = UIToolbar()
//        toolBar.barStyle = UIBarStyle.default
//        toolBar.sizeToFit()
//        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
//        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(self.donePressedOnKeyboard))
//        toolBar.setItems([flexibleSpace, doneButton], animated: false)
//
//        memberAssigneeText.inputView = memberPicker
//        memberAssigneeText.inputAccessoryView = toolBar
    }
    
    // MARK: - Picker View Set up
//
//    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        let assignee = members[row]
//        return assignee
//    }
//
//    func numberOfComponents(in pickerView: UIPickerView) -> Int {
//        return 1
//    }
//
//    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
//        return members.count
//    }
//
//    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//        memberNameLabel.text = members[row]
//        if members[row] == "Off" {
//            memberImage.image = #imageLiteral(resourceName: "Missing Profile")
//        } else {
//            memberImage.image = UIImage(named: "\(members[row])")
//            // save to member relationship to Song task to core data
//        }
//    }
    
    // MARK: - Text Field Options
    
    // Hide the keyboard
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        textField.resignFirstResponder()
//        return true
//    }
//    
//    @objc func donePressedOnKeyboard() {
//        self.endEditing(true)
//    }
    
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
}

