//
//  PrepareCell.swift
//  FHE
//
//  Created by Rylan Evans on 10/12/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class SongTableViewCell: UITableViewCell {
    
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookLabel: UILabel!
    @IBOutlet weak var chapterLabel: UILabel!
    @IBOutlet weak var verseLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
//    var delegate: SongTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(song: Song) {
        let topic = song.topic ?? "Topic"
        let title = song.title ?? "Title"
        let number = song.number ?? "NA"
        let book = song.book ?? "Book"
        topicLabel.text = "\(topic)   "
        titleLabel.text = title
        numberLabel.text = "#\(number)"
        bookLabel.text = book
    }
}

//protocol SongTableViewCellDelegate {
//    func buttonCellButtonTapped(_ sender: SongTableViewCell)
//}

