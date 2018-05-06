//
//  RedditResponseMapper.swift
//  Reddit
//
//  Created by Sam, Ip on 5/5/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class RedditResponseMapper {
    
    let redditItemMapper : RedditItemMapper?
    
    init() {
        redditItemMapper = RedditItemMapper()
    }
    
    func map(_ data : Data?) -> [Item]? {
        
        var results = [Item]()
        
        do {
            let jsonSerialized = try JSONSerialization.jsonObject(with: data!, options: []) as? [String : Any]
            
            guard let json = jsonSerialized, let jsonData = json["data"] else {
                NSLog("Json response missing data!")
                return results
            }
            
            guard let jsonDataChildrenList = jsonData as? [String : Any] else {
                NSLog("Json response missing data children dictionary!")
                return results
            }
            
            guard let jsonArray = jsonDataChildrenList["children"]! as? NSArray else {
                NSLog("Json response missing data children array!")
                return results
            }
            
            for jsonElement in jsonArray {

                if let item = redditItemMapper?.map(jsonElement) {
                    results.append(item)
                }
            }

        }  catch let error as NSError {
            NSLog(error.localizedDescription)
        }
        return results
    }
    
}
