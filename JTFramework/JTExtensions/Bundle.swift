//
//  Bundle.swift
//  JTFramework
//
//  Created by JT on 2018/6/14.
//  Copyright © 2018年 JT. All rights reserved.
//

import Foundation
extension Bundle {
    public static func updateMainToJTBundle() {
        object_setClass(Bundle.main, JTBundle.self)
    }
    static func getUserLanguageBundle() -> Bundle? {
        var lang = JTUserDefaults.shareInstance.getUserLanguage() ?? ""
        if lang == "" {
            lang = JTLanguages.chinese.rawValue
            var count = 0
            while(!JTUserDefaults.shareInstance.setUserLanguage(lang)) {
                if count > 15 { abort() }
                count += 1
            }
        }
        guard let langBundlePath = Bundle.main.path(forResource: lang, ofType: languageBundleType) else { return nil }
        let langBundle = Bundle(path: langBundlePath)
        return langBundle
    }
    private static var languageBundleType: String {
        return "lproj"
    }
}
