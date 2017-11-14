//
//  PrepareCell.swift
//  FHE
//
//  Created by Rylan Evans on 10/12/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

protocol SongCellDelegate {
    func onDeckCellButtonTapped(_ sender: SongCell)
}

class SongCell: UITableViewCell {
    @IBOutlet weak var onDeckImage: UIImageView!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var selectedButton: UIButton!
    
    var delegate: SongCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func onDeckButtonPressed(_ sender: Any) {
        delegate?.onDeckCellButtonTapped(self)
    }
    
    func configureCell(song: Song) {
        let topic = song.topic ?? "Topic"
        let title = song.title
        let number = song.number ?? "NA"
        let book = song.book
        let onDeck = song.selected
        topicLabel.text = "\(topic)   "
        titleLabel.text = title
        numberLabel.text = "#\(number)"
        bookLabel.text = book
        if onDeck == true {
            onDeckImage.image = #imageLiteral(resourceName: "Selected")
        } else {
            onDeckImage.image = #imageLiteral(resourceName: "NotSelected")
        }
    }
}
