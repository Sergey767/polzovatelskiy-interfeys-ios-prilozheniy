//
//  LikeControl.swift
//  Vkontakte
//
//  Created by Серёжа on 19/09/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class LikeControl: UIControl {
    // MARC: - Properties
    @IBInspectable var isLiked: Bool = false
    @IBInspectable var strokeWidht: CGFloat = 2.0
    @IBInspectable var strokeColor: UIColor?
    @IBInspectable var fillColor: UIColor?
    @IBInspectable var count: Int = 0
    @IBOutlet var countLike: UILabel!
    
    // MARC: - Lifecycle
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let bezierPath = UIBezierPath(heartIn: rect)
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        if self.isLiked {
            context.setStrokeColor(UIColor.red.cgColor)
            context.setFillColor(UIColor.red.cgColor)
            count += 1
        } else {
            context.setStrokeColor(UIColor.red.cgColor)
            context.setFillColor(UIColor.clear.cgColor)
            if (count > 0) {
                count -= 1
            }
        }
        countLike.text = String(count)
        
        self.fillColor?.setFill()
        
        bezierPath.lineWidth = self.strokeWidht
        bezierPath.stroke()
        bezierPath.fill()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGestureRG()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGestureRG()
        backgroundColor = .clear
    }
    // MARK: - Privates
    private func setupGestureRG() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapped(_:)))
        tap.numberOfTouchesRequired = 1
        addGestureRecognizer(tap)
    }
    
    @objc private func tapped(_ tapGesture: UITapGestureRecognizer) {
        isLiked.toggle()
        setNeedsDisplay()
        sendActions(for: .valueChanged)
        UILabel.transition(with: countLike, duration: 0.3, options: .transitionFlipFromBottom, animations: {
            self.countLike
        }, completion: nil)
    }
}

extension UIBezierPath {
    convenience init(heartIn rect: CGRect) {
        self.init()
        
        let sideOne = rect.width * 0.4
        let sideTwo = rect.height * 0.3
        let arcRadius = sqrt(sideOne * sideOne + sideTwo * sideTwo) / 2
        
        self.addArc(withCenter: CGPoint(x: rect.width * 0.3, y: rect.height * 0.35), radius: arcRadius, startAngle: 135.degreesToRadians, endAngle: 315.degreesToRadians, clockwise: true)
        
        self.addLine(to: CGPoint(x: rect.width / 2, y: rect.height * 0.2))
        
        self.addArc(withCenter: CGPoint(x: rect.width * 0.7, y: rect.height * 0.35), radius: arcRadius, startAngle: 225.degreesToRadians, endAngle: 45.degreesToRadians, clockwise: true)
        
        self.addLine(to: CGPoint(x: rect.width * 0.5, y: rect.height * 0.95))
        
        self.close()
    }
}

extension Int {
    var degreesToRadians: CGFloat { return CGFloat(self) * .pi / 180 }
}

