//
//  QuoteCell.swift
//  FHE
//
//  Created by Rylan Evans on 12/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit
import AVFoundation

protocol QuoteCellDelegate {
    func quoteSelectedNeedsChanged(_ sender: QuoteCell)
    func quotePreview(_ sender: QuoteCell)
}

class QuoteCell: UITableViewCell {
    @IBOutlet weak var onDeckImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var favoriteImage: UIImageView!
    
    var delegate: QuoteCellDelegate?
    
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
        delegate?.quoteSelectedNeedsChanged(self)
    }
    
    @IBAction func previewButtonPressed(_ sender: Any) {
        delegate?.quotePreview(self)
    }
    
    
    func configureQuoteCell(quote: Quote) {
        let title = quote.title
        let detail = quote.detail
        let onDeck = quote.selected
        let favorite = quote.favorite
        detailsLabel.text = detail
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
    }
}

