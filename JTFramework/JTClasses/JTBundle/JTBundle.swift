//
//  JTBundle.swift
//  JTFramework
//
//  Created by JT on 2018/6/14.
//  Copyright © 2018年 JT. All rights reserved.
//

import Foundation

class JTBundle: Bundle {
    override func localizedString(forKey key: String, value: String?, table tableName: String?) -> String {
        if let bundle = Bundle.getUserLanguageBundle() {
            return bundle.localizedString(forKey: key, value: value, table: tableName)
        } else {
            return super.localizedString(forKey: key, value: value, table: tableName)
        }
    }
}
