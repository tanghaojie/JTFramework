//
//  JTEnum.swift
//  JTFramework
//
//  Created by JT on 2018/4/19.
//  Copyright © 2018年 JT. All rights reserved.
//

public protocol JTEnum {
    var num: Int { get }
    var strNum: String { get }
    var text: String { get }
    var image: UIImage? { get }
}
public extension JTEnum {
    public var num: Int { return 0 }
    public var strNum: String { return "0" }
    public var text: String { return "" }
}
