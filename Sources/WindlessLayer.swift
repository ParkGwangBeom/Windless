//
//  WindlessLayer.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

class WindlessLayer: CALayer {

    fileprivate var gradientLayer: WindlessGradientLayer?
    fileprivate var coverLayer:  CAShapeLayer?
    fileprivate var windlessableLayers: [CALayer] = []
    fileprivate var configuration = WindlessConfiguration()
    var windless: Bool = false {
        didSet {
            guard oldValue != windless else {
                return
            }
            animate(windless)
        }
    }
    
    convenience required init(frame: CGRect, configuration: WindlessConfiguration) {
        self.init()
        self.frame = frame
        self.configuration = configuration
        setupSublayers()
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        layoutIfNeeded()
        setupSublayersPosition()
        setupMaskLayer()
    }
}

// MARK: internal
extension WindlessLayer {
    
    func updateGradientLayer() {
        gradientLayer?.update()
    }
    
    func updateCoverLayerColor(_ color: UIColor) {
        coverLayer?.backgroundColor = color.cgColor
    }
    
    func updateWindlessableLayers(_ layers: [CALayer]) {
        windlessableLayers = layers
    }
}

// MARK: private
private extension WindlessLayer {
    
    var subLayersPath: UIBezierPath {
        let path = UIBezierPath(rect: bounds)
        path.usesEvenOddFillRule = true
        windlessableLayers.forEach {
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
        coverLayer?.mask = maskLayer
    }
    
    func setupSublayers() {
        let gradientLayer = WindlessGradientLayer(frame: frame, configuration: configuration)
        let coverLayer = CAShapeLayer()
        addSublayer(gradientLayer)
        addSublayer(coverLayer)
        self.gradientLayer = gradientLayer
        self.coverLayer = coverLayer
    }

    func setupSublayersPosition() {
        gradientLayer?.frame = bounds
        coverLayer?.frame = bounds
    }
    
    func animate(_ flag: Bool) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.4)
        CATransaction.setCompletionBlock {
            flag ? self.gradientLayer?.show() : self.gradientLayer?.hide()
        }
        let alpha: Float = flag ? 1 : 0
        gradientLayer?.opacity = alpha
        coverLayer?.opacity = alpha
        CATransaction.commit()
    }
}
