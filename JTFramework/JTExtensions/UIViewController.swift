//
//  UIViewController.swift
//  Tianditu_iOS
//
//  Created by JT on 2018/4/13.
//  Copyright © 2018年 JT. All rights reserved.
//

extension UIViewController {
    
    public func jtTopViewController() -> UIViewController {
        if let navi = self.navigationController {
            return navi
        }
        return self
    }
    
    public func jtAlertWithUIAlertAction(
        title: String,
        message: String?,
        uiAlertAction:  [UIAlertAction],
        preferredStyle: UIAlertController.Style = .alert,
        completion: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        for action in uiAlertAction {
            alert.addAction(action)
        }
        self.present(alert, animated: true, completion: completion)
    }
    
}
