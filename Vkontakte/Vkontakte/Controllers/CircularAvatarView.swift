//
//  CircularAvatarView.swift
//  Vkontakte
//
//  Created by Серёжа on 17/08/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class CircularAvatarView: UIView {
    
    private var shadowLayer: CAShapeLayer!
    
    @IBInspectable var shadowColor: UIColor = UIColor.green
    @IBInspectable var shadowRadius: CGFloat = 5
    @IBInspectable var shadowOpacity: Float = 0.9
    
    @IBOutlet weak var imageAvatar: UIImageView!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        imageAvatar.layer.cornerRadius = frame.height / 2
        imageAvatar.clipsToBounds = true
        
        shadowLayer = CAShapeLayer()
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: frame.size.height / 2).cgPath
        shadowLayer.shadowColor = shadowColor.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = .zero
        shadowLayer.shadowOpacity = shadowOpacity
        shadowLayer.shadowRadius = shadowRadius
        layer.insertSublayer(shadowLayer, at: 0)
    }
    
}
