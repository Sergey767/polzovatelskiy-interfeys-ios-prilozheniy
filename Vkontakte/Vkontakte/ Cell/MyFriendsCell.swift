//
//  FriendsCell.swift
//  Vkontakte
//
//  Created by Серёжа on 10/07/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class MyFriendsCell: UITableViewCell {
    
    static let reuseIdentifier = "MyFriendsCell"
    
    @IBOutlet weak var friendsName: UILabel!
    @IBOutlet weak var circularAvatarView: CircularAvatarView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
