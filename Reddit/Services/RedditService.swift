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
    var viewController : ViewController?
    
    init() {
        url = "http://www.reddit.com/.json"
        redditResponseMapper = RedditResponseMapper()
    }
    
    func getResponse(_ viewController : ViewController){
        
        self.viewController = viewController
        let proxy = Proxy(url: url)
        proxy.get(completionHandler)
    }
    
    func completionHandler(data: Data?, response : URLResponse?, error : Error?) {
        
        if data == nil {
            NSLog(error?.localizedDescription ?? "")
            return
        }
        
        if (redditResponseMapper != nil) {
            viewController?.redditDataSource.items = redditResponseMapper!.map(data)!
            viewController?.reloadRedditView()
        }
    }
}
