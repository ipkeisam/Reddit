//
//  Proxy.swift
//  Reddit
//
//  Created by Sam, Ip on 5/4/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation

class Proxy {
    
    var url : String?
    
    init(url: String) {
        self.url = url
    }
    
    var urlObject : URL? {
        get {
            return (url != nil) ? URL(string: url!) : nil
        }
    }
    
    func get(_ completionHandler : @escaping (_ data : Data?, _ response : URLResponse?, _ error : Error?) -> ()) {
        
        if (urlObject == nil) {
            NSLog("Proxy Url cannot be empty")
            return
        }
        
        let task = URLSession.shared.dataTask(with: urlObject!) { (data, response, error) in
            completionHandler(data, response, error)
        }
        
        task.resume()
    }
}
