//
//  UIViewExtensions.swift
//  Reddit
//
//  Created by Sam, Ip on 5/5/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}
