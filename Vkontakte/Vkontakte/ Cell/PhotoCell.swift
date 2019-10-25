//
//  PhotoCell.swift
//  Vkontakte
//
//  Created by Серёжа on 11/07/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class PhotoCell: UICollectionViewCell {
    
    static let reuseIdentifier = "PhotoCell"
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var likePhotoView: VkButtons!
    
}
