//
//  String.swift
//  Tianditu_iOS
//
//  Created by JT on 2018/4/12.
//  Copyright © 2018年 JT. All rights reserved.
//

extension String {
    public var jtUtf8Encoded: Data {
        return data(using: .utf8)!
    }
    public func jtCurrentLocaleDate(format: String) -> Date? {
        return JTCurrentLocaleDateFormatter(format: format).date(from: self)
    }
    public func jtContainsCaseInsensitive(other: String) -> Bool {
        return self.range(of: other, options: .caseInsensitive, range: nil, locale: nil) != nil
    }
}
