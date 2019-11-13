//
//  VkButtons.swift
//  Vkontakte
//
//  Created by Сергей on 13.11.2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class VkButtons: UIControl {
    
    @IBOutlet weak var commentsButton: UIButton! {
        didSet {
            let commentsImage = UIImage(named: "comments")
            self.commentsButton.setImage(commentsImage, for: .normal)
        }
    }
    
    @IBOutlet weak var shareButton: UIButton! {
        didSet {
            let shareImage = UIImage(named: "share")
            self.shareButton.setImage(shareImage, for: .normal)
        }
    }
    
    @IBOutlet weak var viewsButton: UIButton! {
        didSet {
            let viewsImage = UIImage(named: "views")
            self.viewsButton.setImage(viewsImage, for: .normal)
        }
    }
    
    @IBOutlet weak var viewsLabel: UILabel!
}
