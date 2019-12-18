//
//  UIImage.swift
//  Tianditu_iOS
//
//  Created by JT on 2018/4/13.
//  Copyright © 2018年 JT. All rights reserved.
//

extension UIImage {
    
    public func jtData() -> (Data?, String) {
        var data: Data? = self.jpegData(compressionQuality: 1)
        var fileExtension = ".jpg"
        if data == nil {
            data = self.pngData()
            fileExtension = ".png"
        }
        return (data, fileExtension)
    }
    
}
