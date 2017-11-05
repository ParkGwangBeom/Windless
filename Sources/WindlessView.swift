//
//  Windless.swift
//  Windless
//
//  Created by gwangbeom on 2017. 10. 26..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

/*
 alpha 효과를 넣어서 하는것도 좋을듯!!
 */

/*
 이미지일경우 cornerradius 그대로
 */

private let key = "isWindless"

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

public struct Configuration {
    public var colors: [UIColor] = [
        .groupTableViewBackground,
        .groupTableViewBackground,
        UIColor.white.withAlphaComponent(0.85),
        .groupTableViewBackground,
        .groupTableViewBackground
    ]
    
    public var locations: [NSNumber] = [0.0, 0.25, 0.5, 0.75, 1.0]
    
    public var placeholderColor: UIColor = .groupTableViewBackground
}

public class WindlessView: UIView {
    
    public var configuration = Configuration()
    public var isAnimating: Bool = false
    
    // flag가 아닌 어레이로 넣고 싶을 경우
    public var views: [UIView] = []
    
    fileprivate lazy var gradientLayer: CAGradientLayer = {
        let gradientLayer = CAGradientLayer()
        gradientLayer.startPoint = CGPoint(x: -0.3, y: -0.3)
        gradientLayer.endPoint = CGPoint(x: 1.2, y: 1.2)
        gradientLayer.colors = configuration.colors.flatMap{ $0.cgColor }
        gradientLayer.locations = configuration.locations
        gradientLayer.backgroundColor = configuration.placeholderColor.cgColor
        
        return gradientLayer
    }()
    
    fileprivate lazy var coverView: UIView = {
        let coverView = UIView()
        coverView.backgroundColor = .white
        return coverView
    }()
    
    var allSubviews: [UIView] = []
    
    func logView(view: UIView) {
        allSubviews.append(view)
        for subview in view.subviews {
            logView(view: subview)
        }
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        gradientLayer.frame = bounds
        coverView.frame = bounds
        
        layoutIfNeeded()
        // 이부분을 분리시켜야할듯
        let path = UIBezierPath(rect: bounds)
        path.usesEvenOddFillRule = true
        allSubviews
            .filter { $0.isWindless && $0 != self }
            .forEach {
                let rect = $0.convert($0.bounds, to: self)
                let subviewPath = UIBezierPath(roundedRect: rect, cornerRadius: 5)
                path.append(subviewPath)
        }
        
        coverView.layer.mask = makeMaskLayer(at: path)
    }
}

public extension WindlessView {
    
    func show(duration: TimeInterval = 0.3) {
        isAnimating = true
        layer.addSublayer(gradientLayer)
        
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.addSubview(self.coverView)
        }, completion: nil)
        
        allSubviews.removeAll()
        logView(view: self)

        let path = UIBezierPath(rect: bounds)
        path.usesEvenOddFillRule = true
        allSubviews
            .filter { $0.isWindless && $0 != self }
            .forEach {
                let rect = $0.convert($0.bounds, to: self)
                let inViewPath = UIBezierPath(roundedRect: rect, cornerRadius: 5)
                path.append(inViewPath)
            }

        coverView.layer.mask = makeMaskLayer(at: path)
        gradientLayer.add(gradientAnimation, forKey: nil)
    }
    
    func hide(duration: TimeInterval = 0.3) {
        self.gradientLayer.removeAllAnimations()
        self.gradientLayer.removeFromSuperlayer()
            
        UIView.transition(with: self, duration: duration, options: .transitionCrossDissolve, animations: {
            self.coverView.removeFromSuperview()
        }, completion: { _ in
            self.isAnimating = false
        })
    }
}

private extension WindlessView {
    
    var gradientAnimation: CAAnimation {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0.0, 0.0, 0.0, 0.0, 0.25]
        gradientAnimation.toValue = [0.85, 0.9, 0.95, 1.0, 1.0]
        gradientAnimation.duration = 4.0
        gradientAnimation.repeatCount = Float.infinity
        return gradientAnimation
    }
    
    func makeMaskLayer(at path: UIBezierPath) -> CAShapeLayer {
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        maskLayer.fillRule = kCAFillRuleEvenOdd
        maskLayer.backgroundColor = UIColor.white.cgColor
        return maskLayer
    }
}
