//
//  WindlessViewType.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 6..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

public protocol WindlessViewType {
    var direction: Int { get set }
    var speed: Float { get set }
    var beginTime: CGFloat { get set }
    var duration: CGFloat { get set }
    var pauseDuration: CGFloat { get set }
    var animationLayerColor: UIColor { get set }
    var animationBackgroundColor: UIColor { get set }
    var animationLayerOpacity: CGFloat { get set }
    var tleCornerRadius: CGFloat { get set }
    var windlessableViews: [UIView] { get }
}

extension WindlessViewType where Self: UIView {
    
    var windlessLayer: WindlessLayer? {
        return layer as? WindlessLayer
    }
    
    func setupConfiguration() {
        windlessLayer?.configuration.direction = WindlessDirection(rawValue: direction) ?? .right
        windlessLayer?.configuration.speed = speed
        windlessLayer?.configuration.beginTime = CFTimeInterval(beginTime)
        windlessLayer?.configuration.duration = CFTimeInterval(duration)
        windlessLayer?.configuration.pauseDuration = CFTimeInterval(pauseDuration)
        windlessLayer?.configuration.animationLayerColor = animationLayerColor
        windlessLayer?.configuration.animationBackgroundColor = animationBackgroundColor
        windlessLayer?.configuration.animationLayerOpacity = 0.8
        windlessLayer?.configuration.coverLayerColor = backgroundColor ?? .white
        windlessLayer?.configuration.cornerRadius = tleCornerRadius
    }
    
    func windlessableSubviews(of view: UIView) -> [UIView] {
        var subviews = [UIView]()
        for subview in view.subviews {
            subviews += windlessableSubviews(of: subview)
            if subview.isWindless {
                subviews.append(subview)
            }
        }
        return subviews
    }
    
    public var windlessableViews: [UIView] {
        return windlessableSubviews(of: self)
    }
    
    public func windless(_ flag: Bool) {
        setupConfiguration()
        layoutIfNeeded()
        windlessLayer?.setup(windlessLayers: windlessableViews.flatMap{ $0.layer })
        windlessLayer?.windless = flag
    }
}

private let key = "isWindless_Key"

public extension UIView {
    
    @IBInspectable
    var isWindless: Bool {
        get {
            return layer.value(forKey: key) as? Bool ?? false
        }
        set {
            layer.setValue(newValue, forKey: key)
        }
    }
}
