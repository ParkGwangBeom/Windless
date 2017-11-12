//
//  WindlessConfiguration.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

/**
 Objects that define windless animations and skeletons
 */
public class WindlessConfiguration {
    
    /// The direction of windless animation. Defaults to rightDiagonal.
    public var direction: WindlessDirection = .rightDiagonal
    
    /// The speed of windless animation. Defaults to 1.
    public var speed: Float = 1
    
    /// The duration of the fade used when windless begins. Defaults to 0.
    public var beginTime: CFTimeInterval = 0
    
    /// The time interval windless in seconds. Defaults to 4.
    public var duration: CFTimeInterval = 4
    
    /// The time interval between windless in seconds. Defaults to 2.
    public var pauseDuration: CFTimeInterval = 2
    
    /// gradient animation timingFunction default easeOut
    public var timingFuction: CAMediaTimingFunction = .easeOut
    
    /// gradient layer center color default .lightGray
    public var animationLayerColor: UIColor = .lightGray
    
    /// Mask layer background color default .groupTableViewBackground
    public var animationBackgroundColor: UIColor = .groupTableViewBackground
    
    /// The opacity of the content while it is windless. Defaults to 0.8.
    public var animationLayerOpacity: CGFloat = 0.8
}
