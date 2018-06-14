//
//  UserDefaults.swift
//  JTFramework
//
//  Created by JT on 2018/6/14.
//  Copyright © 2018年 JT. All rights reserved.
//

import Foundation

extension UserDefaults {
    public subscript(_ key: String) -> Any? {
        get {
            return object(forKey: key)
        }
        set {
            set(newValue, forKey: key)
        }
    }
}
