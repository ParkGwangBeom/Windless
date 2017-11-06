//
//  WindlessTableView.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 6..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

open class WindlessTableView: UITableView, WindlessViewType {

    @IBInspectable
    open var direction: Int = 0
    
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
    
    @IBInspectable
    open var tleCornerRadius: CGFloat = 0
    
    open override class var layerClass: AnyClass {
        return WindlessLayer.self
    }
    
    open override func layoutSubviews() {
        super.layoutSubviews()
        layer.bounds = self.bounds
    }
}
