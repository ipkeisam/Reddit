//
//  RedditDataSource.swift
//  Reddit
//
//  Created by Sam, Ip on 5/5/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation
import UIKit

class RedditDataSource: NSObject, UITableViewDataSource
{
    let redditService = RedditService()
    var items = [Item]()
    var viewController : ViewController?
    var cellHeight : CGFloat = 0
    
    func loadData(_ name : String) {
        redditService.getResponse(viewController!, name)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let itemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "redditCell", for: indexPath) as! ItemTableViewCell
        
        let item = items[indexPath.row]
        itemTableViewCell.scoreLabel.text = "Score: \(item.score)"
        itemTableViewCell.titleLabel.text = "Title: \(item.title)"
        itemTableViewCell.numCommentLabel.text = "Comments: \(item.numComments)"
        itemTableViewCell.imageView?.imageFromURL(item, cellHeight)
        
        if indexPath.row == items.count - 1 {
            loadData(item.name)
        }
        
        return itemTableViewCell
    }
}
