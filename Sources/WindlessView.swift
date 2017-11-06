//
//  Windless.swift
//  Windless
//
//  Created by gwangbeom on 2017. 10. 26..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

open class WindlessView: UIView, WindlessViewType {
    
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
    open var animationLayerColor: UIColor = .lightGray
    
    @IBInspectable
    open var animationBackgroundColor: UIColor = .groupTableViewBackground
    
    @IBInspectable
    open var animationLayerOpacity: CGFloat = 0.5
    
    // 기본 백그라운드 색 따라가기로
//    @IBInspectable
//    open var coverLayerColor: UIColor = .white
    
    @IBInspectable
    open var tleCornerRadius: CGFloat = 0
    
    // view쪽만 설정 가능하도록
    private var useContainer = false
    public var container: [UIView] = [] {
        didSet {
            useContainer = true
        }
    }
    
    public var windlessableViews: [UIView] {
        return useContainer ? container: windlessableSubviews(of: self)
    }
    
    open override class var layerClass: AnyClass {
        return WindlessLayer.self
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.bounds = self.bounds
    }
}
