//
//  JTNibLoadable.swift
//  JTFramework
//
//  Created by JT on 2018/4/23.
//  Copyright © 2018年 JT. All rights reserved.
//
public protocol JTNibLoader {}
public extension JTNibLoader where Self: UIView {
    static func loadFromNib(_ nibname: String? = nil) -> Self {
        let loadname = nibname == nil ? "\(self)" : nibname!
        let x = Bundle.main.loadNibNamed(loadname, owner: nil, options: nil)?.first as! Self
        return x
    }
}
