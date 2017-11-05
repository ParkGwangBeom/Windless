//
//  WindlessConfiguration.swift
//  Windless-iOS
//
//  Created by NAVER on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

struct WindlessConfiguration: Windless {
    var direction: WindlessDirection = .right
    var shape: WindlessShape = .straight
    var animationSpeed: Float = 1
    var animationDuration: CFTimeInterval = 4
    var pauseDuration: CFTimeInterval = 2
    var animationLayerColor: UIColor = .groupTableViewBackground
    var animationLayerOpacity: CGFloat = 0.8
    var coverLayerColor: UIColor = .white
    var cornerRadius: CGFloat = 4
}
