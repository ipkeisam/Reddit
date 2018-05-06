//
//  ViewController.swift
//  Reddit
//
//  Created by Sam, Ip on 5/4/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var redditTableView: UITableView!
    
    let redditService = RedditService()
    var items = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redditTableView.dataSource = self
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let itemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "redditCell", for: indexPath) as! ItemTableViewCell
        
        let item = items[indexPath.row]
        itemTableViewCell.scoreLabel.text = "Score: \(item.score)"
        itemTableViewCell.titleLabel.text = "Title: \(item.title)"
        itemTableViewCell.numCommentLabel.text = "Comments: \(item.numComments)"
        
        do {
            let data = try Data(contentsOf: URL(string: (item.image?.url)!)!)
            let image = UIImage(data: data)
            itemTableViewCell.imageView?.frame  = CGRect(x: 300, y: 0, width: (item.image?.width)!, height: (item.image?.height)!)
            itemTableViewCell.imageView?.image = image
        
        }  catch let error as NSError {
            print(error.localizedDescription)
        }
        return itemTableViewCell
    }
}

