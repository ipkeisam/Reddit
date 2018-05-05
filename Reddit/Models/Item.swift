//
//  Item.swift
//  Reddit
//
//  Created by Sam, Ip on 5/4/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class Item {
    
    var score : Int = 0
    var title : String = ""
    var numComments : Int = 0
    var image : Image?
    
    init(_ score : Int, _ title : String, _ numComments : Int, _ image : Image?) {
        self.score = score
        self.title = title
        self.numComments = numComments
        self.image = image
    }
}
