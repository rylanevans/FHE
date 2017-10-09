//
//  UIImageViewWithMask.swift
//  FHE
//
//  Created by Rylan Evans on 10/7/17.
//  Copyright © 2017 Rylan Evans. All rights reserved.
//

import UIKit

@IBDesignable
class MaskWithShadow: UIImageView {
    
    var imageToMaskView = UIImageView()
    var maskingImageView = UIImageView()
    
    @IBInspectable
    var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable
    var imageToMask: UIImage? {
        didSet {
            imageToMaskView.image = imageToMask
            updateView()
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor = UIColor.clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }
    
    @IBInspectable
    var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize = CGSize(width: 0, height: 0) {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    
    func updateView() {
        
        if imageToMaskView.image != nil {
            imageToMaskView.frame = bounds
            imageToMaskView.contentMode = .scaleAspectFill
            
            maskingImageView.image = image // The Mask
            maskingImageView.frame = bounds
            maskingImageView.contentMode = .scaleAspectFit
            
            imageToMaskView.layer.mask = maskingImageView.layer
            
            addSubview(imageToMaskView)
        }
    }
}
