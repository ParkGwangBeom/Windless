//
//  Windless.swift
//  Windless
//
//  Created by gwangbeom on 2017. 10. 26..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

open class WindlessView: UIView {
    
    @IBInspectable
    open var direction: Int = 0
    
//    @IBInspectable
//    open var shape: Int = 1
    
    @IBInspectable
    open var speed: Float = 1
    
    @IBInspectable
    open var beginTime: CGFloat = 0
    
    @IBInspectable
    open var duration: CGFloat = 4
    
    @IBInspectable
    open var pauseDuration: CGFloat = 3
    
    @IBInspectable
    open var animationLayerColor: UIColor = .white
    
    @IBInspectable
    open var animationBackgroundColor: UIColor = .groupTableViewBackground
    
    @IBInspectable
    open var animationLayerOpacity: CGFloat = 0.8
    
    // 기본 백그라운드 색 따라가기로
//    @IBInspectable
//    open var coverLayerColor: UIColor = .white
    
    @IBInspectable
    open var tleCornerRadius: CGFloat = 0
    
    public var windless: Bool = false {
        didSet {
            windlessLayer?.windless = windless
        }
    }
    
    public var coverViews: [UIView] = [] {
        didSet {
            setupConfiguration()
            windlessLayer?.setup(windlessLayers: coverViews.flatMap { $0.layer })
        }
    }
    
    open override class var layerClass: AnyClass {
        return WindlessLayer.self
    }
    
    // 수정해야할지말지...
    fileprivate var allViews: [UIView] = [] {
        didSet {
//            coverViews = allViews.filter{ $0.isWindless }
        }
    }
    
    fileprivate func loadAllViews(view: UIView) {
        allViews.append(view)
        for subview in view.subviews {
            loadAllViews(view: subview)
        }
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        
        // 수정할지 말지 결정해야할듯...
        loadAllViews(view: self)
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.bounds = self.bounds
    }
}

private extension WindlessView {
    
    var windlessLayer: WindlessLayer? {
        return layer as? WindlessLayer
    }
    
    func setupConfiguration() {
        windlessLayer?.configuration.direction = WindlessDirection(rawValue: direction) ?? .right
//        windlessLayer?.configuration.shape = WindlessShape(rawValue: shape) ?? .straight
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
}
