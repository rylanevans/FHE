//
//  ThoughtVC.swift
//  FHE
//
//  Created by Rylan Evans on 9/19/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

class ThoughtVC: UIViewController {
    @IBOutlet weak var thoughtMemberPhotoImage: UIImageView!
    @IBOutlet weak var thoughtMemberNameLabel: UILabel!
    @IBOutlet weak var thoughtTitleLabel: UILabel!
    @IBOutlet weak var thoughtDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func closeButtonPressed(_ sender: Any) {

        dismiss(animated: true, completion: nil)
    }
}
