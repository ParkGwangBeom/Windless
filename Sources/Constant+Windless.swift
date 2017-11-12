//
//  Constant+Windless.swift
//  Windless-iOS
//
//  Created by NAVER on 2017. 11. 13..
//  Copyright © 2017년 Windless. All rights reserved.
//

import Foundation

struct AnimationKeys {
    static let locations = "locations"
}

struct TransitionKeys {
    static let fade = "fade"
}

struct DefaultAnimationValue {
    struct Locations {
        static let from: [NSNumber] = [-0.4, -0.2, 0.0]
        static let to: [NSNumber] = [1.0, 2.5, 3]
    }
}
