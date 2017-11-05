//
//  WindlessConfiguration.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

struct WindlessConfiguration: Windless {
    var direction: WindlessDirection = .right
//    var shape: WindlessShape = .straight
    var speed: Float = 1
    var beginTime: CFTimeInterval = 0
    var duration: CFTimeInterval = 4
    var pauseDuration: CFTimeInterval = 2
    var animationLayerColor: UIColor = .white
    var animationBackgroundColor: UIColor = .groupTableViewBackground
    var animationLayerOpacity: CGFloat = 0.8
    var coverLayerColor: UIColor = .white
    var cornerRadius: CGFloat = 4
}

