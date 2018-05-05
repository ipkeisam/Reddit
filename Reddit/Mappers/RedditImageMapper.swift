//
//  RedditImageMapper.swift
//  Reddit
//
//  Created by Sam, Ip on 5/5/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class RedditImageMapper {
    
    func map(_ jsonElementData : [String : Any]) -> Image? {
        
        guard let images = jsonElementData["preview"] as? [String : Any] else {
            print("Preview dictionary is missing. No image is available.")
            return nil
        }
        
        guard let imageArray = images["images"] as? NSArray else {
            print("Image array is missing")
            return nil
        }
        
        guard let imageElement = imageArray[0] as? [String : Any] else {
            print("Image element is missing")
            return nil
        }
        
        guard let imageElementSource = imageElement["source"] as? [String : Any] else {
            print("Image source is missing")
            return nil
        }
        
        guard let url = imageElementSource["url"] as? String else {
            print("Image url is misisng")
            return nil
        }
        
        guard let height = imageElementSource["height"] as? Int else {
            print("Image height is missing")
            return nil
        }
        
        guard let width = imageElementSource["width"] as? Int else {
            print("Image width is missing")
            return nil
        }

        return Image(url, width, height)
    }
            
}
