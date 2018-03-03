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
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var enabledSwitch: UISwitch!
    @IBOutlet weak var taskTitleLabel: UILabel!
    

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
        if counter.launched > 1 {
            playClick()
        }
        delegate?.enabledNeedsChanged(self)
    }
    
    func configureTaskCell(task: Task) {
        let specifictask = task
        let name = specifictask.name ?? ""
        switch task.name {
        case "Opening Prayer"?: taskNameLabel.text = "Opening Prayer";
        taskTitleLabel.text = specifictask.selectedPrayer?.title ?? "No Prayer selected"
        case "Song"?: taskNameLabel.text = "Songs";
        taskTitleLabel.text = specifictask.selectedSong?.title ?? "No Song selected"
        case "Rule"?: taskNameLabel.text = "Rules";
        taskTitleLabel.text = specifictask.selectedRule?.title ?? "No Rule selected"
        case "Scripture"?: taskNameLabel.text = "Scriptures";
        taskTitleLabel.text = specifictask.selectedScripture?.title ?? "No Scripture selected"
        case "Calendar"?: taskNameLabel.text = "Calendar";
        taskTitleLabel.text = specifictask.selectedCalendar?.title ?? "No Calendar selected"
        case "Testimony"?: taskNameLabel.text = "Testimony";
        taskTitleLabel.text = specifictask.selectedTestimony?.title ?? "No Testimony selected"
        case "Spotlight"?: taskNameLabel.text = "Spotlight";
        taskTitleLabel.text = specifictask.selectedSpotlight?.title ?? "No Spotlight selected"
        case "Thought"?: taskNameLabel.text = "Thought";
        taskTitleLabel.text = specifictask.selectedThought?.title ?? "No Thought selected"
        case "Quote"?: taskNameLabel.text = "Quotes";
        taskTitleLabel.text = specifictask.selectedQuote?.title ?? "No Quote selected"
        case "Lesson"?: taskNameLabel.text = "Lessons";
        taskTitleLabel.text = specifictask.selectedLesson?.title ?? "No Lesson selected"
        case "Council"?: taskNameLabel.text = "Council";
        taskTitleLabel.text = specifictask.selectedCouncil?.title ?? "No Council selected"
        case "Activity"?: taskNameLabel.text = "Activities";
        taskTitleLabel.text = specifictask.selectedGame?.title ?? "No Activity selected"
        case "Closing Prayer"?: taskNameLabel.text = "Closing Prayer";
        taskTitleLabel.text = specifictask.selectedClosing?.title ?? "No Prayer selected"
        case "Treat"?: taskNameLabel.text = "Treats";
        taskTitleLabel.text = specifictask.selectedTreat?.title ?? "No Treat selected"
        default: taskNameLabel.text = name
        }
        
        let image = task.image ?? #imageLiteral(resourceName: "NoPhoto")
        let enabled = task.enabled
        taskImage.image = image as? UIImage
        enabledSwitch.isOn = enabled
    }
}
