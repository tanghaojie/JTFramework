//
//  Tianditu_TileLevel.swift
//  Tianditu_iOS
//
//  Created by JT on 2018/5/21.
//  Copyright © 2018年 JT. All rights reserved.
//

public enum Tianditu_TileLevel: Int {
    case level3 = 3
    case level4 = 4
    case level5 = 5
    case level6 = 6
    case level7 = 7
    case level8 = 8
    case level9 = 9
    case level10 = 10
    case level11 = 11
    case level12 = 12
    case level13 = 13
    case level14 = 14
    case level15 = 15
    case level16 = 16
    case level17 = 17
    case level18 = 18
}
extension Tianditu_TileLevel: Tianditu_TileLevelProtocol {
    public var resolution: Double {
        switch self {
        case .level3:
            return 0.17578125
        case .level4:
            return 0.087890625
        case .level5:
            return 0.0439453125
        case .level6:
            return 0.02197265625
        case .level7:
            return 0.010986328125
        case .level8:
            return 0.0054931640625
        case .level9:
            return 0.00274658203125
        case .level10:
            return 0.001373291015625
        case .level11:
            return 0.0006866455078125
        case .level12:
            return 0.00034332275390625
        case .level13:
            return 0.000171661376953125
        case .level14:
            return 0.0000858306884765625
        case .level15:
            return 0.00004291534423828125
        case .level16:
            return 0.000021457672119140625
        case .level17:
            return 0.000010728836059570313
        case .level18:
            return 0.0000053644180297851562
        }
    }
    
    public var scale: Double {
        switch self {
        case .level3:
            return 73957338.8625
        case .level4:
            return 36978669.43125
        case .level5:
            return 18489334.715625
        case .level6:
            return 9244667.3578125
        case .level7:
            return 4622333.67890625
        case .level8:
            return 2311166.83945312
        case .level9:
            return 1155583.41972656
        case .level10:
            return 577791.70986328
        case .level11:
            return 288895.85493164
        case .level12:
            return 144447.92746582
        case .level13:
            return 72223.96373291
        case .level14:
            return 36111.98186646
        case .level15:
            return 18055.99093323
        case .level16:
            return 9027.99546661
        case .level17:
            return 4513.99773331
        case .level18:
            return 2256.99886665
        }
    }
}

public protocol Tianditu_TileLevelProtocol {
    var scale: Double { get }
    var resolution: Double { get }
}
