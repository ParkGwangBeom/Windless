//
//  AnimationFactory.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 12..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

enum AnimationType: String {
    case locations
    case scale
    case position
    
    var animation: CABasicAnimation {
        return CABasicAnimation(keyPath: rawValue)
    }
}

// TODO: add animation
class AnimationFactory {
    
    fileprivate var configuration: WindlessConfiguration
    init(configuration: WindlessConfiguration) {
        self.configuration = configuration
    }
    
    func makeAnimation<T>(type: AnimationType, from: T, to: T) -> CAAnimation {
        let animation = type.animation
        animation.fromValue = from
        animation.toValue = to
        animation.duration = configuration.duration
        return animation
    }
    
    func makeGroupAnimation(_ animations: [CAAnimation]) -> CAAnimation {
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = animations
        groupAnimation.beginTime = CACurrentMediaTime() + configuration.beginTime
        groupAnimation.duration = configuration.duration + configuration.pauseDuration
        groupAnimation.speed = configuration.speed
        groupAnimation.timingFunction = configuration.timingFuction
        groupAnimation.repeatCount = .infinity
        return groupAnimation
    }
}

extension AnimationFactory {
    
    func locationAnimation() -> CAAnimation {
        let animation = makeAnimation(type: .locations, from: DefaultValue.Animation.Locations.from, to: DefaultValue.Animation.Locations.to)
        return makeGroupAnimation([animation])
    }
}
