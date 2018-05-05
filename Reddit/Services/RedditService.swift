//
//  RedditService.swift
//  Reddit
//
//  Created by Sam, Ip on 5/4/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class RedditService {
    
    let url : String
    let redditResponseMapper : RedditResponseMapper?
    var results : [Item]?
    
    init() {
        url = "http://www.reddit.com/.json"
        redditResponseMapper = RedditResponseMapper()
    }
    
    func getResponse() {
        
        let proxy = Proxy(url: url)
        proxy.get(completionHandler)
    }
    
    func completionHandler(data: Data?, response : URLResponse?, error : Error?) {
        
        if data == nil {
            print(error?.localizedDescription ?? "")
            return
        }
        
        if (redditResponseMapper != nil) {
            results = redditResponseMapper!.map(data)
        }
    }
}
