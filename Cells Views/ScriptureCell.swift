//
//  ScriptureCell.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import AVFoundation

protocol ScriptureCellDelegate {
    func scriptureSelectedNeedsChanged(_ sender: ScriptureCell)
    func scripturePreview(_ sender: ScriptureCell)
}

class ScriptureCell: UITableViewCell {
    @IBOutlet weak var onDeckImage: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var scriptureLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    var delegate: ScriptureCellDelegate?
    
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
        delegate?.scriptureSelectedNeedsChanged(self)
    }
    
    @IBAction func previewButtonPressed(_ sender: Any) {
        delegate?.scripturePreview(self)
    }
    
    
    func configureScriptureCell(scripture: Scripture) {
        let topic = scripture.topic ?? "Topic"
        let title = scripture.title
        
        var volume = ""
        if scripture.volume == "dc-testament" {
            volume = "DC"
        } else if scripture.volume != nil {
            volume = scripture.volume!
        }
        
        var book = ""
        if scripture.book == "dc" {
            book = ""
        } else if scripture.book != nil {
            book = scripture.book!
        }
        
        let chapter = scripture.chapter
        
        var chapterVerse = ""
        if scripture.verse == nil || scripture.verse == "" {
            chapterVerse = ""
        } else {
            chapterVerse = "\(chapter ?? "") : \(scripture.verse ?? "")"
        }
        
        let onDeck = scripture.selected
        let favorite = scripture.favorite
        topicLabel.text = "\(topic)   "
        titleLabel.text = title
        scriptureLabel.text = "\(volume.uppercased()) \(book.capitalized) \(chapterVerse)"
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

