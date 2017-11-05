//
//  Windless.swift
//  Windless
//
//  Created by gwangbeom on 2017. 10. 26..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

public class WindlessView: UIView {
    
    
    
    public override class var layerClass: AnyClass {
        return WindlessLayer.self
    }
    
    @IBInspectable
    public var direction: Int = 0
    
    @IBInspectable
    public var shape: Int = 1
    
    @IBInspectable
    public var animationSpeed: Float = 1
    
    @IBInspectable
    public var animationDuration: CGFloat = 1
    
    @IBInspectable
    public var pauseDuration: CGFloat = 1
    
    @IBInspectable
    public var animationLayerColor: UIColor = .groupTableViewBackground
    
    @IBInspectable
    public var animationLayerOpacity: CGFloat = 0.8
    
    @IBInspectable
    public var coverLayerColor: UIColor = .white
    
    @IBInspectable
    public var tleCornerRadius: CGFloat = 0
    
    
    
    
    
    public var coverViews: [UIView] = []
    
    
    
    // 이부분은 제거 하자
    var allSubviews: [UIView] = []
    
    func logView(view: UIView) {
        allSubviews.append(view)
        for subview in view.subviews {
            logView(view: subview)
        }
    }
    
    public var windless: Bool = false {
        didSet {
            windlessLayer?.windless = windless
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayer()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        setupLayer()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        layer.bounds = self.bounds
    }
}

private extension WindlessView {
    
    var windlessLayer: WindlessLayer? {
        return layer as? WindlessLayer
    }
    
    var configuration: WindlessConfiguration {
        var configuration = WindlessConfiguration()
        configuration.direction = WindlessDirection(rawValue: direction) ?? .right
        configuration.shape = WindlessShape(rawValue: shape) ?? .straight
        configuration.animationSpeed = animationSpeed
        configuration.animationDuration = CFTimeInterval(animationDuration)
        configuration.pauseDuration = CFTimeInterval(pauseDuration)
        configuration.animationLayerColor = animationLayerColor
        configuration.animationLayerOpacity = 0.8
        configuration.coverLayerColor = coverLayerColor
        configuration.cornerRadius = tleCornerRadius
        return configuration
    }
    
    func setupLayer() {
        // TODO: 수정해야함
        allSubviews.removeAll()
        logView(view: self)
        if coverViews.isEmpty {
            windlessLayer?.windlessLayers = allSubviews.filter { $0.isWindless }.flatMap { $0.layer }
        } else {
            windlessLayer?.windlessLayers = coverViews.flatMap { $0.layer }
        }
        windlessLayer?.configuration = configuration
        windlessLayer?.setupLayer()
    }
}
