//
//  WindlessGradientLayer.swift
//  Windless
//
//  Created by gwangbeom on 2017. 10. 26..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

class WindlessGradientLayer: CAGradientLayer {
    
    fileprivate var configuration: WindlessConfiguration = WindlessConfiguration()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init()
    }
    
    convenience init(frame: CGRect, configuration: WindlessConfiguration) {
        self.init()
        self.configuration = configuration
        
        startPoint = configuration.direction.location.start
        endPoint = configuration.direction.location.end
        colors = [configuration.animationLayerColor, UIColor.lightGray.withAlphaComponent(configuration.animationLayerOpacity), configuration.animationLayerColor]
            .flatMap{ $0.cgColor }
        locations = [-0.2, -0.1, 0.0]
        
        // TODO: background color색에 따라서 뒤에보이게끔도 가능할듯
        backgroundColor = configuration.animationLayerColor.cgColor
    }
    
    func show() {
        add(gradientAnimation(), forKey: locationAnimationKey)
    }
    
    func hide() {
        removeAnimation(forKey: locationAnimationKey)
    }
    
    private let locationAnimationKey = "location_key"
}

private extension WindlessGradientLayer {
    
    func gradientAnimation() -> CAAnimation {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        
        // TODO: width 값 설정
        gradientAnimation.fromValue = [-0.2, -0.1, 0.0]
        gradientAnimation.toValue = [1.0, 1.1, 1.2]
        gradientAnimation.duration = configuration.animationDuration
        
        let groupAnimation = CAAnimationGroup()
        groupAnimation.animations = [gradientAnimation]
        groupAnimation.duration = configuration.animationDuration + configuration.pauseDuration
        groupAnimation.repeatCount = Float.infinity
        groupAnimation.speed = configuration.animationSpeed
        
        return groupAnimation
    }
}
