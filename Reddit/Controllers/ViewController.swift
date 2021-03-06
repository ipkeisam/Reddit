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
    let cellHeight : CGFloat = 70
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redditTableView.dataSource = redditDataSource
        redditTableView.delegate = self
        redditTableView.activityStartAnimating(activityColor: UIColor.blue, backgroundColor: UIColor.clear)
        redditDataSource.viewController = self
        redditDataSource.cellHeight = cellHeight
        redditDataSource.loadData("")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func reloadRedditView() {
        redditTableView.activityStopAnimating()
        redditTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}

