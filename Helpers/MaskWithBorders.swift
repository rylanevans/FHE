//
//  MaskWithBorders.swift
//  FHE
//
//  Created by Rylan Evans on 10/9/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

@IBDesignable
class MaskWithBorder: UIImageView {
    var maskImageView = UIImageView()
    
    @IBInspectable
    var maskImage: UIImage? {
        didSet {
            maskImageView.image = maskImage
            maskImageView.frame = bounds
            self.mask = maskImageView
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable
    var cornorRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornorRadius
        }
    }
}
