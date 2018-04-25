//
//  JTHUD.swift
//  Tianditu_iOS
//
//  Created by JT on 2018/4/16.
//  Copyright © 2018年 JT. All rights reserved.
//

import Foundation
import MBProgressHUD

public class JTHUD {
    
    private let view: UIView
    public init(view: UIView) {
        self.view = view
    }
    
    public func jtMBProgressHUD_Indeterminate(removeOnHide: Bool = true, delayTimeIfAutoHide: TimeInterval? = nil) -> MBProgressHUD {
        let hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud.mode = .indeterminate
        hud.backgroundView.style = .blur
        hud.removeFromSuperViewOnHide = removeOnHide
        if let hd = delayTimeIfAutoHide {
            hud.hide(animated: true, afterDelay: hd)
        }
        return hud
    }
    
}
