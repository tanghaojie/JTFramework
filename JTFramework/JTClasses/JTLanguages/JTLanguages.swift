//
//  JTLanguages.swift
//  JTFramework
//
//  Created by JT on 2018/6/14.
//  Copyright © 2018年 JT. All rights reserved.
//

import Foundation

public enum JTLanguages: String {
    case chinese = "zh-Hans"
    case english = "en"
}
extension JTLanguages {
    public static func set(language: JTLanguages) {
        if language.rawValue == JTUserDefaults.shareInstance.getUserLanguage() { return }
        var count = 0
        while(!JTUserDefaults.shareInstance.setUserLanguage(language.rawValue)) {
            if count > 15 { abort() }
            count += 1
        }
        Bundle.updateMainToJTBundle()
    }
    public static func getCurrentUserLanguage() -> JTLanguages? {
        guard let ul = JTUserDefaults.shareInstance.getUserLanguage() else { return nil }
        return JTLanguages(rawValue: ul)
    }
    public static func getAppleLanguage() -> JTLanguages? {
        guard let al = JTUserDefaults.shareInstance.getAppleLanguage() else { return nil }
        return JTLanguages(rawValue: al)
    }
}
