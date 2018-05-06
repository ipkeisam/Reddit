//
//  UIImageViewExtensions.swift
//  Reddit
//
//  Created by Sam, Ip on 5/5/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//
import UIKit

extension UIImageView {
public func imageFromURL(urlString: String) {
    
    URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
        
        if error != nil {
            print(error ?? "")
            return
        }
        DispatchQueue.main.async(execute: { () -> Void in
            let image = UIImage(data: data!)
            self.image = image
            self.superview?.layoutSubviews()
        })
        
    }).resume()
}}
