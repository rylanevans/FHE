//
//  FamilyCell.swift
//  FHE
//
//  Created by Rylan Evans on 10/24/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import AVFoundation

protocol FamilyCellDelegate {
    func attendingNeedsChanged(_ sender: FamilyCell)
}

class FamilyCell: UITableViewCell {
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attendingSwitch: UISwitch!
    
    var delegate: FamilyCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        attendingSwitch.borderColor = #colorLiteral(red: 1, green: 0.3512835503, blue: 0.1226655617, alpha: 1)
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
    
    @IBAction func attendingSwitchPressed(_ sender: Any) {
        if counter.launched > 1 {
            playClick()
        }
        delegate?.attendingNeedsChanged(self)
        runAssignmentsYoungestToOldest()
    }
    
    
    func configureFamilyCell(member: Member) {
        let name = member.name ?? ""
        let photo = member.photo ?? #imageLiteral(resourceName: "NoPhoto")
        let attending = member.attending
        memberImage.image = photo as? UIImage
        nameLabel.text = name
        attendingSwitch.isOn = attending
    }
}
