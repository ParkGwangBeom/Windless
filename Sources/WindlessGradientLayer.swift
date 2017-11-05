//
//  WindlessGradientLayer.swift
//  Windless
//
//  Created by gwangbeom on 2017. 10. 26..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

class WindlessGradientLayer: CAGradientLayer {

    fileprivate struct AnimationKey {
        static let location = "location_key"
    }
    fileprivate var configuration = WindlessConfiguration()
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    override init() {
        super.init()
    }
    
    convenience init(frame: CGRect, configuration: WindlessConfiguration) {
        self.init()
        self.configuration = configuration
        prepare()
    }
}

// MARK: internal
extension WindlessGradientLayer {
    
    func show() {
        add(gradientAnimation(), forKey: AnimationKey.location)
    }
    
    func hide() {
        removeAnimation(forKey: AnimationKey.location)
    }
}

// MARK: private
private extension WindlessGradientLayer {
    
    func prepare() {
        startPoint = configuration.direction.location.start
        endPoint = configuration.direction.location.end
        colors = [configuration.animationBackgroundColor,
                  configuration.animationLayerColor.withAlphaComponent(configuration.animationLayerOpacity),
                  configuration.animationBackgroundColor].flatMap{ $0.cgColor }
        locations = [-0.2, -0.1, 0.0]
        
        // TODO: background color색에 따라서 뒤에보이게끔도 가능할듯
        backgroundColor = configuration.animationBackgroundColor.cgColor
    }
}

// MARK: Animation
private extension WindlessGradientLayer {
    
    func gradientAnimation() -> CAAnimation {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        
        // TODO: width 값 설정
        gradientAnimation.fromValue = [-0.2, -0.1, 0.0]
        gradientAnimation.toValue = [1.0, 1.1, 1.2]
        gradientAnimation.duration = configuration.duration
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [gradientAnimation]
        groupAnimation.beginTime = CACurrentMediaTime() + configuration.beginTime
        groupAnimation.duration = configuration.duration + configuration.pauseDuration
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.speed = configuration.speed
        
        return groupAnimation
    }
}
