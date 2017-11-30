//
//  TaskCell.swift
//  FHE
//
//  Created by Rylan Evans on 11/13/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import AVFoundation

protocol TaskCellDelegate {
    func enabledNeedsChanged(_ sender: TaskCell)
}

class TaskCell: UITableViewCell {
    @IBOutlet weak var taskImage: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var enabledSwitch: UISwitch!

    var delegate: TaskCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    static var clickSound: AVAudioPlayer!
    
    func clickSoundURL() {
        let click = Bundle.main.path(forResource: "Click", ofType: "wav")
        let clickURL = URL(fileURLWithPath: click!)
        do {
            try UIViewController.clickSound = AVAudioPlayer(contentsOf: clickURL)
        } catch let err as NSError {
            print(err.debugDescription)
        }
    }
    
    func playClick() {
        if UIViewController.clickSound.isPlaying {
            UIViewController.clickSound.stop()
        }
        UIViewController.clickSound.play()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func enabledSwitchPressed(_ sender: Any) {
        playClick()
        delegate?.enabledNeedsChanged(self)
    }
    
    func configureTaskCell(task: Task) {
        let name = task.name ?? ""
        switch task.name {
        case "Song"?: taskLabel.text = "Songs"
        case "Rule"?: taskLabel.text = "Rules"
        case "Scripture"?: taskLabel.text = "Scriptures"
        case "Lesson"?: taskLabel.text = "Lessons"
        case "Thought"?: taskLabel.text = "Thoughts"
        case "Council"?: taskLabel.text = "Councils"
        case "Activity"?: taskLabel.text = "Activities"
        case "Treat"?: taskLabel.text = "Treats"
        default: taskLabel.text = name
        }
        
        let image = task.image ?? #imageLiteral(resourceName: "NoPhoto")
        let enabled = task.enabled
        taskImage.image = image as? UIImage
        enabledSwitch.isOn = enabled
    }
}
