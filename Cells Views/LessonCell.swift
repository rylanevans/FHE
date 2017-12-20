//
//  LessonCell.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import AVFoundation

protocol LessonCellDelegate {
    func lessonSelectedNeedsChanged(_ sender: LessonCell)
    func lessonPreview(_ sender: LessonCell)
}

class LessonCell: UITableViewCell {
    @IBOutlet weak var onDeckImage: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    var delegate: LessonCellDelegate?
    
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
        delegate?.lessonSelectedNeedsChanged(self)
    }
    
    @IBAction func previewButtonPressed(_ sender: Any) {
        delegate?.lessonPreview(self)
    }
    
    
    func configureLessonCell(lesson: Lesson) {
        let topic = lesson.topic ?? "Topic"
        let title = lesson.title
        let number = String(lesson.number)
        let book = lesson.book
        let onDeck = lesson.selected
        let favorite = lesson.favorite
        topicLabel.text = "\(topic)   "
        titleLabel.text = title
        if number == "0" || number == "" {
            numberLabel.text = ""
        } else {
            numberLabel.text = "#\(number)"
        }
        bookLabel.text = book
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
    }
}

