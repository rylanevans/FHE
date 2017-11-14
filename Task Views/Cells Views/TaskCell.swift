//
//  TaskCell.swift
//  FHE
//
//  Created by Rylan Evans on 11/13/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    @IBOutlet weak var taskImage: UIImageView!
    @IBOutlet weak var taskLabel: UILabel!
    @IBOutlet weak var enabledSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureTaskCell(task: Task) {
        let name = task.name ?? ""
        let image = task.image ?? #imageLiteral(resourceName: "NoPhoto")
        let enabled = task.enabled
        taskImage.image = image as? UIImage
        taskLabel.text = name
        enabledSwitch.isOn = enabled
    }
}
