//
//  Maker.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 12..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

class Maker {
    
    static func makeWindlessableLayersPath(in container: UIView) -> UIBezierPath {
        let path = UIBezierPath(rect: container.bounds)
        path.usesEvenOddFillRule = true
        container.subviewsHierarchy.filter{ $0.isWindlessable && $0 != container }.forEach {
            let rect = $0.convert($0.bounds, to: container)
            let subviewPath = UIBezierPath(roundedRect: rect, cornerRadius: $0.layer.cornerRadius)
            path.append(subviewPath)
        }
        return path
    }
    
    static func makeNotWindlessableLayers(in container: UIView) -> [CALayer] {
        return container.subviewsHierarchy
            .filter{ !$0.isWindlessable && $0 != container }
            .flatMap {
                let copy = CALayer(layer: $0.layer)
                copy.contents = $0.layer.contents
                copy.contentsGravity = $0.layer.contentsGravity
                copy.backgroundColor = $0.backgroundColor?.cgColor
                copy.cornerRadius = $0.layer.cornerRadius
                copy.contentsScale = $0.layer.contentsScale
                copy.frame = $0.convert($0.bounds, to: container)
                return copy
        }
    }
}

private extension UIView {
    
    var subviewsHierarchy: [UIView] {
        return [self] + subviews.flatMap { $0.subviewsHierarchy }
    }
}
