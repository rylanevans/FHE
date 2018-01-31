//
//  Underline.swift
//  FHE
//
//  Created by Rylan Evans on 12/27/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

extension UILabel {
    func underlined(){
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width:  self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }

    func setBottomBorder() {
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = #colorLiteral(red: 0.9879999757, green: 0.7409999967, blue: 0.01600000076, alpha: 1)
        self.layer.shadowOffset = CGSize(width: 0.0, height: 0.35)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
