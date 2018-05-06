//
//  ViewController.swift
//  Reddit
//
//  Created by Sam, Ip on 5/4/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var redditTableView: UITableView!
    
    let redditService = RedditService()
    let redditDataSource = RedditDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redditTableView.dataSource = redditDataSource
        redditTableView.delegate = self
        redditService.getResponse(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }

    func reloadRedditView() {
        redditTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

