//
//  Image.swift
//  Reddit
//
//  Created by Sam, Ip on 5/4/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class Image {
    
    var url : String = ""
    var width : Int = 0
    var height : Int = 0
    
    init(_ url : String, _ width : Int, _ height : Int) {
        self.url = url
        self.width = width
        self.height = height
    }
}
