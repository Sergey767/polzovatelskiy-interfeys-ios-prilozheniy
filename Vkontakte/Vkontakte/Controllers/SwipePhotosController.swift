//
//  SwipePhotosController.swift
//  Vkontakte
//
//  Created by Сергей on 16.10.2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class SwipePhotosController: UIViewController {
    
    @IBOutlet weak var centralImage: UIImageView!
    @IBOutlet weak var leftImage: UIImageView!
    @IBOutlet weak var rightImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        centralImage.image = UIImage(named: ImageFriend.getImage())
        leftImage.image = UIImage(named: ImageFriend.getImage())
        rightImage.image = UIImage(named: ImageFriend.getImage())
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipedLeft(gesture:)))
        swipeLeft.direction = .left
        view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipedRight(gesture:)))
        swipeRight.direction = .right
        view.addGestureRecognizer(swipeRight)
    }
    
    @objc func swipedLeft(gesture: UISwipeGestureRecognizer) {
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.3, animations: {
                self.centralImage.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.9, animations: {
                self.centralImage.transform = CGAffineTransform(translationX: self.centralImage.bounds.width, y: 0)
                self.centralImage.alpha = 0
                self.rightImage.transform = CGAffineTransform(translationX: -self.rightImage.bounds.width, y: 0)
            })
        }, completion: { _ in
            self.centralImage.image = self.rightImage.image
            self.centralImage.alpha = 1
            self.centralImage.transform = .identity
            
            self.rightImage.transform = .identity
            self.rightImage.image = UIImage(named: ImageFriend.getImage())
        })
    }
    
    @objc func swipedRight(gesture: UISwipeGestureRecognizer) {
        CATransaction.begin()
        CATransaction.setCompletionBlock {
            self.centralImage.image = self.leftImage.image
            self.centralImage.layer.removeAllAnimations()
            self.leftImage.image = UIImage(named: ImageFriend.getImage())
        }
        
        let scale = CABasicAnimation(keyPath: "transform.scale")
        scale.toValue = 0.7
        scale.duration = 0.3
        scale.fillMode = CAMediaTimingFillMode.forwards
        scale.isRemovedOnCompletion = false
        self.centralImage.layer.add(scale, forKey: nil)
        
        let opacity = CABasicAnimation(keyPath: "opacity")
        opacity.fromValue = 1
        opacity.toValue = 0
        opacity.beginTime = CACurrentMediaTime() + 0.3
        opacity.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.centralImage.layer.add(opacity, forKey: nil)
        
        let moveRight = CABasicAnimation(keyPath: "position.x")
        moveRight.toValue = self.centralImage.center.x - self.centralImage.bounds.width
        moveRight.duration = 0.9
        moveRight.beginTime = CACurrentMediaTime() + 0.3
        moveRight.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.centralImage.layer.add(moveRight, forKey: nil)
        
        let moveLeft = CABasicAnimation(keyPath: "position.x")
        moveLeft.toValue = self.leftImage.center.x + self.leftImage.bounds.width
        moveLeft.duration = 0.9
        moveLeft.beginTime = CACurrentMediaTime() + 0.3
        moveLeft.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.leftImage.layer.add(moveLeft, forKey: nil)
        CATransaction.commit()
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
