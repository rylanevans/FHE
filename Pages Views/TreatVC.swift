//
//  TreatVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class TreatVC: UIViewController {
    @IBOutlet weak var treatCategoryLabel: UILabel!
    @IBOutlet weak var treatMemberPhotoImage: UIImageView!
    @IBOutlet weak var treatMemberNameLabel: UILabel!
    @IBOutlet weak var treatTitleLabel: UILabel!
    @IBOutlet weak var treatImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closedButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}
