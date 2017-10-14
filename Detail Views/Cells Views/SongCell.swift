//
//  PrepareCell.swift
//  FHE
//
//  Created by Rylan Evans on 10/12/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class SongCell: UITableViewCell {
    
    @IBOutlet weak var songTitleLabel: UILabel!
    @IBOutlet weak var songSourceLabel: UILabel!
    @IBOutlet weak var songNumberLabel: UILabel!
    @IBOutlet weak var songURLLabel: UILabel!
    @IBOutlet weak var songDateLabel: UILabel!
    @IBOutlet weak var songActiveLabel: UILabel!
    @IBOutlet weak var songManualOrderLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(song: Song) {
        songTitleLabel.text = song.songTitle
        songSourceLabel.text = song.songSource
        songNumberLabel.text = "#\(String(describing: song.songNumber))"
        songURLLabel.text = song.songURL
        songDateLabel.text = "\(String(describing: song.songDateCreated))"
        songActiveLabel.text = "\(song.songActive)"
        songManualOrderLabel.text = "\(song.songAssignmentOrder)"
    }

}
