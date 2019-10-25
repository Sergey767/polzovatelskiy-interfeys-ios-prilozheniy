//
//  SearchGroupCell.swift
//  Vkontakte
//
//  Created by Серёжа on 11/07/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class SearchGroupCell: UITableViewCell {
    
    static let reuseIdentifier = "SearchGroupCell"
    
    @IBOutlet weak var searchGroupName: UILabel!
    @IBOutlet weak var searchGroupImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
