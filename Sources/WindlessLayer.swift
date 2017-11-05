//
//  WindlessLayer.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

class WindlessLayer: CALayer {

    fileprivate lazy var gradientLayer = WindlessGradientLayer(frame: bounds, configuration: configuration)
    fileprivate lazy var coverLayer = CAShapeLayer()
    fileprivate var windlessLayers: [CALayer] = [] {
        didSet {
            layoutIfNeeded()
            setupSublayers()
        }
    }
    
    var configuration = WindlessConfiguration()
    
    var windless: Bool = false {
        didSet {
            guard oldValue != windless else {
                return
            }
            
            // TODO: 수정해야할듯.. 현재 애니메이션을 끌때 번져가는 것같은 오류 있음.
            CATransaction.begin()
            CATransaction.setAnimationDuration(0.4)
            CATransaction.setCompletionBlock {
                self.windless ? self.gradientLayer.show() : self.gradientLayer.hide()
            }
            gradientLayer.isHidden = !windless
            coverLayer.isHidden = !windless
            CATransaction.commit()
        }
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()

//        layoutIfNeeded() // 이부분은 allValue방법 쓸때 in view에 들어간 프레임 맞춰줄려고 써줘야함
        setupPosition()
        setupMaskLayer()
    }
}

// MARK: internal
extension WindlessLayer {
    
    func setup(windlessLayers: [CALayer]) {
        self.windlessLayers = windlessLayers
    }
}

// MARK: private
private extension WindlessLayer {
    
    var subLayersPath: UIBezierPath {
        let path = UIBezierPath(rect: bounds)
        path.usesEvenOddFillRule = true
        windlessLayers.forEach {
            let rect = $0.convert($0.bounds, to: self)
            let subviewPath = UIBezierPath(roundedRect: rect, cornerRadius: configuration.cornerRadius)
            path.append(subviewPath)
        }
        return path
    }
    
    func setupMaskLayer() {
        let maskLayer = CAShapeLayer()
        maskLayer.path = subLayersPath.cgPath
        maskLayer.fillRule = kCAFillRuleEvenOdd
        coverLayer.mask = maskLayer
    }

    func setupSublayers() {
        gradientLayer.isHidden = true
        addSublayer(gradientLayer)
        
        coverLayer.backgroundColor = configuration.coverLayerColor.cgColor
        coverLayer.isHidden = true
        addSublayer(coverLayer)
    }
    
    func setupPosition() {
        coverLayer.frame = bounds
        gradientLayer.frame = bounds
    }
}
