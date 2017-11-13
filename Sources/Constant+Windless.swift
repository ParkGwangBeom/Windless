//
//  Constant+Windless.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 13..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

struct AnimationKeys {
    static let locations = "locations"
}

struct TransitionKeys {
    static let fade = "fade"
}

struct DefaultValue {
    struct Animation {
        struct Locations {
            static let from: [NSNumber] = [-0.4, -0.2, 0.0]
            static let to: [NSNumber] = [1.0, 2.5, 3]
        }
    }
    
    struct MultipleLine {
        static let lineHeight: CGFloat = 21
        static let lineSpacing: CGFloat = 10
    }
}

struct AssociatedKeys {
    struct MultiLine {
        static var lineHeight = "lineHeightKey"
        static var lineSpacing = "lineSpacingKey"
    }
    
    struct Windless {
        static var isWindlessable = "isWindlessableKey"
        static var windless = "windlessKey"
    }
}
