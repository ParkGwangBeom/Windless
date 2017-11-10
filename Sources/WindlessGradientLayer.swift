//
//  WindlessGradientLayer.swift
//  Windless
//
//  Created by gwangbeom on 2017. 10. 26..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

class WindlessGradientLayer: CAGradientLayer {

    fileprivate var configuration: WindlessConfiguration
    
    required init?(coder aDecoder: NSCoder) {
        configuration = WindlessConfiguration()
        super.init(coder: aDecoder)
    }
    
    override init() {
        configuration = WindlessConfiguration()
        super.init()
    }
    
    override init(layer: Any) {
        configuration = WindlessConfiguration()
        super.init(layer: layer)
    }
    
    convenience required init(frame: CGRect, configuration: WindlessConfiguration) {
        self.init()
        self.frame = frame
        self.configuration = configuration
        update()
    }
}

// MARK: internal
private let GradientAnimationKey = "GradientAnimationKey"
extension WindlessGradientLayer {
    
    func show() {
        add(gradientAnimation(), forKey: GradientAnimationKey)
    }
    
    func hide() {
        removeAnimation(forKey: GradientAnimationKey)
    }
}

extension WindlessGradientLayer {
    
    func update() {
        startPoint = configuration.direction.location.start
        endPoint = configuration.direction.location.end
        colors = [configuration.animationBackgroundColor,
                  configuration.animationLayerColor.withAlphaComponent(configuration.animationLayerOpacity),
                  configuration.animationBackgroundColor].flatMap{ $0.cgColor }
        locations = [-0.4, -0.2, 0.0]
        backgroundColor = configuration.animationBackgroundColor.cgColor
    }
}

// MARK: Animation
private extension WindlessGradientLayer {
    
    func gradientAnimation() -> CAAnimation {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        
        // TODO: calculator width
        gradientAnimation.fromValue = [-0.4, -0.2, 0.0]
        
        // TODO: custom location
        gradientAnimation.toValue = [1.0, 2.5, 3]
        gradientAnimation.duration = configuration.duration

        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [gradientAnimation]
        groupAnimation.beginTime = CACurrentMediaTime() + configuration.beginTime
        groupAnimation.duration = configuration.duration + configuration.pauseDuration
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.speed = configuration.speed
        groupAnimation.timingFunction = configuration.timingFuction
        
        return groupAnimation
    }
}
