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
    
    var windlessableLayers: [CALayer] = []
    var configuration = WindlessConfiguration()
    var windless: Bool = false {
        didSet {
            guard oldValue != windless else {
                return
            }
            animate(windless)
        }
    }
    
    override init() {
        super.init()
        addSublayer(gradientLayer)
        addSublayer(coverLayer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        layoutIfNeeded()    // 이부분은 수정좀 해야될거 같은데...
        setupPosition()
        setupMaskLayer()
    }
}

// MARK: internal
extension WindlessLayer {
    
    func update() {
        gradientLayer.update()
    }
    
    func updateCoverLayerColor(_ color: UIColor) {
        coverLayer.backgroundColor = color.cgColor
    }
    
    func animate(_ flag: Bool) {
        CATransaction.begin()
        CATransaction.setAnimationDuration(0.4)
        CATransaction.setCompletionBlock {
            flag ? self.gradientLayer.show() : self.gradientLayer.hide()
        }
        let alpha: Float = flag ? 1 : 0
        gradientLayer.opacity = alpha
        coverLayer.opacity = alpha
        CATransaction.commit()
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
        coverLayer.mask = maskLayer
    }

    func setupPosition() {
        coverLayer.frame = bounds
        gradientLayer.frame = bounds
    }
}
