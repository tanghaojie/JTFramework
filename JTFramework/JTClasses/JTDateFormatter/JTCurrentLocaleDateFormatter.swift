//
//  CurrentLocaleDateFormatter.swift
//  JTFramework
//
//  Created by JT on 2018/4/17.
//  Copyright © 2018年 JT. All rights reserved.
//

import Foundation

public class JTCurrentLocaleDateFormatter: DateFormatter {
    
    public init(format: String) {
        super.init()
        locale = Locale.current
        dateFormat = format
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
