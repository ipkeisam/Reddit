//
//  UIImageViewExtensions.swift
//  Reddit
//
//  Created by Sam, Ip on 5/5/18.
//  Copyright © 2018 Sam, Ip. All rights reserved.
//
import UIKit

extension UIImageView {
    func imageFromURLAsync(_ urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
            
            if error != nil {
                NSLog(error!.localizedDescription)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
                self.superview?.layoutSubviews()
            })
            
        }).resume()
    }
    
    func imageFromURL(_ item : Item, _ height : CGFloat) {
        if (item.image == nil) {
            return
        }
        
        do {
            let data = try Data(contentsOf: URL(string: (item.image?.url)!)!)
            let image = UIImage(data: data)
            let width : CGFloat = CGFloat(((item.image?.width)! / (item.image?.height)!)) * height
            self.frame  = CGRect(x: 0, y: 0, width: width, height: height)
            self.image = image
        
        }  catch let error as NSError {
            NSLog(error.localizedDescription)
        }
    }
    
}
