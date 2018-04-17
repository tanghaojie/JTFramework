//
//  JTHUD.swift
//  Tianditu_iOS
//
//  Created by JT on 2018/4/16.
//  Copyright © 2018年 JT. All rights reserved.
//

import Foundation
import MBProgressHUD

class JTHUD {
    
    private let view: UIView
    init(view: UIView) {
        self.view = view
    }
    
    func jtMBProgressHUD_Indeterminate(removeOnHide: Bool = true, delayTimeIfAutoHide: TimeInterval? = nil) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        hud.backgroundView.style = .blur
        hud.removeFromSuperViewOnHide = true
        if let hd = delayTimeIfAutoHide {
            hud.hide(animated: true, afterDelay: hd)
        }
        return hud
    }
    
}
