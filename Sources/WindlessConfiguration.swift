//
//  WindlessConfiguration.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

public class WindlessConfiguration: WindlessType {
    public var direction: WindlessDirection = .rightDiagonal
    public var speed: Float = 1
    public var beginTime: CFTimeInterval = 0
    public var duration: CFTimeInterval = 4
    public var pauseDuration: CFTimeInterval = 2
    public var timingFuction: CAMediaTimingFunction = .easeOut
    public var animationLayerColor: UIColor = .lightGray
    public var animationBackgroundColor: UIColor = .groupTableViewBackground
    public var animationLayerOpacity: CGFloat = 0.8
    public var cornerRadius: CGFloat = 4
}
