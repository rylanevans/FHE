//
//  PrepareCell.swift
//  FHE
//
//  Created by Rylan Evans on 10/12/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

protocol SongCellDelegate {
    func songSelectedNeedsChanged(_ sender: SongCell)
}

class SongCell: UITableViewCell {
    @IBOutlet weak var onDeckImage: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var selectedButton: UIButton!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    var delegate: SongCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func selectedButtonPressed(_ sender: Any) {
        delegate?.songSelectedNeedsChanged(self)
    }
    
    func configureSongCell(song: Song) {
        let topic = song.topic ?? "Topic"
        let title = song.title
        let number = String(song.number)
        let book = song.book
        let onDeck = song.selected
        let favorite = song.favorite
        topicLabel.text = "\(topic)   "
        titleLabel.text = title
        if number == "0" {
            numberLabel.text = "Video"
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
