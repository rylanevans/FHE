//
//  RuleVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class RuleVC: UIViewController {
    @IBOutlet weak var ruleCategoryLabel: UILabel!
    @IBOutlet weak var ruleMemberPhotoImage: UIImageView!
    @IBOutlet weak var ruleMemberNameLabel: UILabel!
    @IBOutlet weak var ruleTitleLabel: UILabel!
    @IBOutlet weak var ruleDetailLabel: UILabel!

    @IBAction func closeButtonPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
