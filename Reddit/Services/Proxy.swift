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
    
    var urlObject : URL {
        get {
            return URL(string: url!)!
        }
    }
    
    func get(_ completionHandler : @escaping (_ data : Data?, _ response : URLResponse?, _ error : Error?) -> ()) {
        
        let task = URLSession.shared.dataTask(with: urlObject) { (data, response, error) in
            completionHandler(data, response, error)
        }
        
        task.resume()
    }
}
