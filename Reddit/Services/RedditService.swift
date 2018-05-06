//
//  RedditService.swift
//  Reddit
//
//  Created by Sam, Ip on 5/4/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class RedditService {
    
    let rootUrl : String
    let redditResponseMapper : RedditResponseMapper?
    var viewController : ViewController?
    
    init() {
        rootUrl = "http://www.reddit.com/.json"
        redditResponseMapper = RedditResponseMapper()
    }
    
    func getResponse(_ viewController : ViewController, _ name : String){
        
        self.viewController = viewController
        let url = name.isEmpty ? rootUrl : "\(rootUrl)?after=\(name)"
        let proxy = Proxy(url: url)
        proxy.get(completionHandler)
    }
    
    func completionHandler(data: Data?, response : URLResponse?, error : Error?) {
        
        if data == nil {
            NSLog(error?.localizedDescription ?? "")
            return
        }
        
        if (redditResponseMapper != nil) {
            let results : [Item] = redditResponseMapper!.map(data)!
            viewController?.redditDataSource.items.append(contentsOf: results)
            viewController?.reloadRedditView()
        }
    }
}
