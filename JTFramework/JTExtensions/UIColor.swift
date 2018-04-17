//
//  UIColor.swift
//  Tianditu_iOS
//
//  Created by JT on 2018/4/12.
//  Copyright © 2018年 JT. All rights reserved.
//

extension UIColor{
    public convenience init(r : CGFloat, g : CGFloat, b : CGFloat){
        self.init(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
