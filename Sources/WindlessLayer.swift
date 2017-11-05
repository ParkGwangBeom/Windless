//
//  WindlessLayer.swift
//  Windless-iOS
//
//  Created by NAVER on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

class WindlessLayer: CALayer {
    
    var configuration: WindlessConfiguration = WindlessConfiguration()
    
    var windlessLayers: [CALayer] = []
    
    var windless: Bool = false {
        didSet {
            guard oldValue != windless else {
                return
            }
            
            // TODO: 수정해야할듯.. 현재 애니메이션을 끌때 번져가는 것같은 오류 있음.
//            self.windless ? self.gradientLayer.show() : self.gradientLayer.hide()
            CATransaction.begin()
            CATransaction.setAnimationDuration(5)
            CATransaction.setCompletionBlock {
                
            }
            gradientLayer.isHidden = !windless
            coverLayer.isHidden = !windless
            CATransaction.commit()
        }
    }
    
    fileprivate lazy var gradientLayer = WindlessGradientLayer(frame: bounds, configuration: configuration)
    
    fileprivate lazy var coverLayer: CAShapeLayer = {
        let coverLayer = CAShapeLayer()
        coverLayer.backgroundColor = configuration.coverLayerColor.cgColor
        coverLayer.isHidden = true
        return coverLayer
    }()
    
    override func layoutSublayers() {
        super.layoutSublayers()
        layoutIfNeeded()
        setupPosition()
    }
    
    func setupLayer() {
        addSublayer(gradientLayer)
        addSublayer(coverLayer)
        
        gradientLayer.isHidden = true
        coverLayer.isHidden  = true
    }
}

private extension WindlessLayer {
    
    func setupPosition() {
        coverLayer.frame = bounds
        gradientLayer.frame = bounds
        setupMaskLayer()
    }
    
    func setupMaskLayer() {
        let path = UIBezierPath(rect: bounds)
        path.usesEvenOddFillRule = true
        windlessLayers.forEach {
            let rect = $0.convert($0.bounds, to: self)
            let subviewPath = UIBezierPath(roundedRect: rect, cornerRadius: configuration.cornerRadius)
            path.append(subviewPath)
        }
        coverLayer.mask = createMask(at: path)
    }
    
    func createMask(at path: UIBezierPath) -> CAShapeLayer {
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        maskLayer.fillRule = kCAFillRuleEvenOdd
        return maskLayer
    }
}
