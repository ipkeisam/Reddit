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
            print("Json response missing element dictionary!")
            return nil
        }
        
        guard let jsonElementData = jsonElement["data"] as? [String : Any] else {
            print("Json response missing element data dictionary!")
            return nil
        }
        
        guard let score = jsonElementData["score"] as? Int else{
            print("Score is missing")
            return nil
        }
        
        guard let title = jsonElementData["title"] as? String else {
            print("Title is missing")
            return nil
        }
        
        guard let num_comments = jsonElementData["num_comments"] as? Int else {
            print("Num comments is missing")
            return nil
        }
        
        return Item(score, title, num_comments, redditImageMapper?.map(jsonElementData))

    }

}
