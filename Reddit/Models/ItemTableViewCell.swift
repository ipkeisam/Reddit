//
//  ItemTableViewCell.swift
//  Reddit
//
//  Created by Sam, Ip on 5/5/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import UIKit

class ItemTableViewCell : UITableViewCell {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var numCommentLabel: UILabel!
    @IBOutlet var previewImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
