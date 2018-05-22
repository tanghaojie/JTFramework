//
//  Global_Common.swift
//  JTFramework
//
//  Created by JT on 2018/5/21.
//  Copyright © 2018年 JT. All rights reserved.
//

import Foundation

public class Global_Common {
    public static let shareInstance = Global_Common()
    private init() {}
    
    public let global_DateAndTimeFormate = "yyyy-MM-dd HH:mm:ss"
    public let global_DateFormate = "yyyy-MM-dd"
    
    public enum HttpMethod: String {
        case GET = "GET"
        case POST = "POST"
    }
    
    public var global_TodayStartDate: Date? = {
        let date = Date()
        let cal = Calendar.current
        var dateComponents = cal.dateComponents([.year,.month,.day,.hour,.minute,.second], from: date)
        dateComponents.hour = 0
        dateComponents.minute = 0
        dateComponents.second = 0
        return cal.date(from: dateComponents)
    }()
    
    public let ScreenWidth = UIScreen.main.bounds.width
    public let ScrennHeight = UIScreen.main.bounds.height
}
