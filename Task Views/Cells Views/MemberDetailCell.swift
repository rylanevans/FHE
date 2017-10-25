//
//  MemberDetailCell.swift
//  FHE
//
//  Created by Rylan Evans on 10/24/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class MemberDetailCell: UITableViewCell {
    @IBOutlet weak var memberImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var attendingSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureMemberDetailCell(member: Member) {
        let name = member.name ?? ""
        let photo = member.photo ?? #imageLiteral(resourceName: "NoPhoto")
        let attending = member.attending
        memberImage.image = photo as? UIImage
        nameLabel.text = name
        attendingSwitch.isOn = attending
    }
}
