//
//  RedditItemMapper.swift
//  Reddit
//
//  Created by Sam, Ip on 5/5/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class RedditItemMapper {
    
    let redditImageMapper : RedditImageMapper?
    
    init() {
        redditImageMapper = RedditImageMapper()
    }
    
    func map(_ jsonElement : Any?) -> Item? {
        guard let jsonElement = jsonElement as? [String : Any] else {
            NSLog("Json response missing element dictionary!")
            return nil
        }
        
        guard let jsonElementData = jsonElement["data"] as? [String : Any] else {
            NSLog("Json response missing element data dictionary!")
            return nil
        }
        
        guard let score = jsonElementData["score"] as? Int else{
            NSLog("Score is missing")
            return nil
        }
        
        guard let title = jsonElementData["title"] as? String else {
            NSLog("Title is missing")
            return nil
        }
        
        guard let num_comments = jsonElementData["num_comments"] as? Int else {
            NSLog("Num comments is missing")
            return nil
        }
        
        guard let name = jsonElementData["name"] as? String else {
            NSLog("Name is missing")
            return nil
        }
        
        return Item(score, title, num_comments, name, redditImageMapper?.map(jsonElementData))

    }

}
