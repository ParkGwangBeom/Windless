//
//  Windless.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

public class Windless {
    
    fileprivate var configuration: WindlessConfiguration
    fileprivate var context: WindlessContext
    fileprivate var windlessLayer: WindlessLayer
    
    init(container: UIView) {
        container.setNeedsLayout()
        container.layoutIfNeeded()
        configuration = WindlessConfiguration()
        context = WindlessContext(container: container)
        windlessLayer = WindlessLayer(frame: container.bounds, context: context)
    }
}

// MARK: setup
public extension Windless {
    
    /**
     **apply** helps you define the information you need for windless.
     
     - Parameters:
     - config: WindlessConfiguration
     */
    @discardableResult
    func apply(_ setup: (WindlessConfiguration) -> Void) -> Self {
        setup(configuration)
        return self
    }
    
    /**
     Set the isWindlessable value of views to true
     
     - Parameters:
     - views: Views that will be the skeleton of the loading view
     */
    @discardableResult
    func setupWindlessableViews(_ views: [UIView]) -> Self {
        views.forEach { $0.isWindlessable = true }
        return self
    }
}

// MARK: animation
public extension Windless {
    
    // TODO: animation custom
    /// Start windless animation
    func start() {
        context.updateAnimationLayer(configuration: configuration)
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            guard let `self` = self else {
                return
            }
            let animation = AnimationFactory(configuration: self.configuration).locationAnimation()
            self.context.start(animation)
            self.setupScrollEnabled(false)
        }
        let transition = TransitionFactory.fade()
        context.container.layer.add(transition, forKey: TransitionKeys.fade)
        context.container.layer.addSublayer(windlessLayer)
        CATransaction.commit()
    }
    
    /// End windless animation
    func end() {
        CATransaction.begin()
        CATransaction.setCompletionBlock { [weak self] in
            self?.context.end()
            self?.setupScrollEnabled(true)
        }
        let transition = TransitionFactory.fade()
        context.container.layer.add(transition, forKey: TransitionKeys.fade)
        windlessLayer.removeFromSuperlayer()
        CATransaction.commit()
    }
}

private extension Windless {
    
    func setupScrollEnabled(_ flag: Bool) {
        guard let scrollView = context.container as? UIScrollView else {
            return
        }
        scrollView.isScrollEnabled = flag
    }
}
