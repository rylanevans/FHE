//
//  RuleCell.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import AVFoundation

protocol RuleCellDelegate {
    func ruleSelectedNeedsChanged(_ sender: RuleCell)
    func rulePreview(_ sender: RuleCell)
}

class RuleCell: UITableViewCell {
    @IBOutlet weak var onDeckImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var previewTextField: UIButton!
    
    var delegate: RuleCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        clickSoundURL()
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
    
    @IBAction func selectedButtonPressed(_ sender: Any) {
        playClick()
        delegate?.ruleSelectedNeedsChanged(self)
    }
    
    @IBAction func previewButtonPressed(_ sender: Any) {
        delegate?.rulePreview(self)
    }
    
    
    func configureRuleCell(rule: Rule) {
        let title = rule.title
        let detail = rule.detail
        let onDeck = rule.selected
        let favorite = rule.favorite
        let url = rule.url
        detailsLabel.text = "\(detail ?? "")"
        titleLabel.text = title
        if onDeck == true {
            onDeckImage.image = #imageLiteral(resourceName: "Selected")
        } else {
            onDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        }
        if favorite == true {
            favoriteImage.isHidden = false
        } else {
            favoriteImage.isHidden = true
        }
        if url == nil || url == "" || url?.hasPrefix("https://") != true {
            previewTextField.isEnabled = false
        }
    }
}

