//
//  ViewController.swift
//  Reddit
//
//  Created by Sam, Ip on 5/4/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let redditService = RedditService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redditService.getResponse()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }

}

