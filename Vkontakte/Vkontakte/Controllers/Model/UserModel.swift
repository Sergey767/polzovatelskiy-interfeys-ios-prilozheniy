//
//  UserModel.swift
//  Vkontakte
//
//  Created by Серёжа on 12/07/2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class User {
    var name: String
    var surname: String
    var imageAvatar: String
    var imagePhoto: String

    init(name: String, surname: String, imageAvatar: String, imagePhoto: String) {
        self.name = name
        self.surname = surname
        self.imageAvatar = imageAvatar
        self.imagePhoto = imagePhoto
    }
}


