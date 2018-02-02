//
//  GameCell.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import AVFoundation

protocol GameCellDelegate {
    func gameSelectedNeedsChanged(_ sender: GameCell)
    func gamePreview(_ sender: GameCell)
}

class GameCell: UITableViewCell {
    @IBOutlet weak var onDeckImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    @IBOutlet weak var previewTextField: UIButton!
    
    var delegate: GameCellDelegate?
    
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
        delegate?.gameSelectedNeedsChanged(self)
    }
    
    @IBAction func previewButtonPressed(_ sender: Any) {
        delegate?.gamePreview(self)
    }
    
    
    func configureGameCell(game: Game) {
        let title = game.title
        let category = game.category
        let onDeck = game.selected
        let favorite = game.favorite
        let url = game.url
        categoryLabel.text = category
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
        
        if url == nil || url == "" {
            previewTextField.isEnabled = false
        }
    }
}

