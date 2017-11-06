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

            CATransaction.begin()
            CATransaction.setAnimationDuration(0.4)
            CATransaction.setCompletionBlock {
                self.windless ? self.gradientLayer.show() : self.gradientLayer.hide()
            }
            let alpha: Float = windless ? 1 : 0
            gradientLayer.opacity = alpha
            coverLayer.opacity = alpha
            CATransaction.commit()
        }
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
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
        guard let sublayers = sublayers, !sublayers.contains(gradientLayer) else {
            return
        }
        addSublayer(gradientLayer)
        coverLayer.backgroundColor = configuration.coverLayerColor.cgColor
        addSublayer(coverLayer)
    }
    
    func setupPosition() {
        coverLayer.frame = bounds
        gradientLayer.frame = bounds
    }
}
