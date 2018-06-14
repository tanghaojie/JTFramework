//
//  JTUserDefaultsOperate.swift
//  JTFramework
//
//  Created by JT on 2018/6/14.
//  Copyright © 2018年 JT. All rights reserved.
//

import Foundation

class JTUserDefaults {
    private init() {}
    internal static let shareInstance = JTUserDefaults()
    private let userLanguageKey = "MyUserLanguage"
    private let appleLanguage = "AppleLanguages"
    private let standard = UserDefaults.standard
}
extension JTUserDefaults {
    func getUserLanguage() -> String? {
        return standard[userLanguageKey] as? String
    }
    func setUserLanguage(_ language: String) -> Bool {
        standard[userLanguageKey] = language
        return standard.synchronize()
    }
    func getAppleLanguage() -> String? {
        guard let appleLang = standard[appleLanguage] as? NSArray else { return nil }
        guard appleLang.count > 0 else { return nil }
        return appleLang.object(at: 0) as? String
    }
}
