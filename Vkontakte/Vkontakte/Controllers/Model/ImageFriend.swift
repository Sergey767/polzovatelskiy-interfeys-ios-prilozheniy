//
//  ImageFriend.swift
//  Vkontakte
//
//  Created by Сергей on 17.10.2019.
//  Copyright © 2019 appleS. All rights reserved.
//

import UIKit

class ImageFriend {
    private static let arrayFriend: [String] = ["simpsons", "simpsons2", "simpsons4", "simpsons3"]
    
    static func getImage() -> String {
        return
            arrayFriend[Int(arc4random_uniform(UInt32(arrayFriend.count)))]
    }
}
