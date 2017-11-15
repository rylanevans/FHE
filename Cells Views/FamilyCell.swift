//
//  FamilyCell.swift
//  FHE
//
//  Created by Rylan Evans on 10/24/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

protocol FamilyCellDelegate {
    func attendingNeedsChanged(_ sender: FamilyCell)
}

class FamilyCell: UITableViewCell {
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attendingSwitch: UISwitch!
    
    var delegate: FamilyCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func attendingSwitchPressed(_ sender: Any) {
        delegate?.attendingNeedsChanged(self)
    }
    
    
    func configureFamilyCell(member: Member) {
        let name = member.name ?? ""
        let photo = member.photo ?? #imageLiteral(resourceName: "NoPhoto")
        let attending = member.attending
        memberImage.image = photo as? UIImage
        nameLabel.text = name
        attendingSwitch.isOn = attending
    }
}
