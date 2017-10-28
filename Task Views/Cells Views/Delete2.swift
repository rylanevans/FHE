//
//  SongTitleCell.swift
//  FHE
//
//  Created by Rylan Evans on 10/17/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//
//
//import UIKit
//
//class SongTitleCell: UITableViewCell {
//    @IBOutlet weak var songAssigneeMemberImage: UIImageView!
//    @IBOutlet weak var songAssigneeLabel: UILabel!
//    @IBOutlet weak var segment: UISegmentedControl!
//    
//    var delegate: SongTitleCellDelegate?
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//        
//        // Configure the view for the selected state
//    }
//    
//    @IBAction func songSegemtChanged(_ sender: Any) {
//        if let delegate = delegate {
//            delegate.segmentChanged(self)
//        }
//    }
//    
//    func configureSongTitleCell(song: Song) {
//        let book = song.book ?? "Book"
//        songAssigneeLabel.text = book
//    }
//}
//
//protocol SongTitleCellDelegate {
//    func segmentChanged(_ sender: SongTitleCell)
//}

