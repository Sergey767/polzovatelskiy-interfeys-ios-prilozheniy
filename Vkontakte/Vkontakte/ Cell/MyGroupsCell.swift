//
//  MyGroupsCell.swift
//  Vkontakte
//
//  Created by Серёжа on 11/07/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class MyGroupsCell: UITableViewCell {
    
    static let reuseIdentifier = "MyGroupsCell"
    
    @IBOutlet weak var groupsName: UILabel!
    @IBOutlet weak var myGroupsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
