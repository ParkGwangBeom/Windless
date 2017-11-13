//
//  MultipleLines.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 13..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

public protocol CanBeMultipleLines {
    
    var lineHeight: CGFloat { get set }
    
    var spacing: CGFloat { get set }
}

extension CanBeMultipleLines {
    
    // TODO: Refactoring
    func addMultipleLinePaths(path: UIBezierPath, frame: CGRect) {
        let numberOfLines = Int(round(frame.height / (lineHeight + spacing)))
        for index in 0..<numberOfLines {
            let spacingAndHeight: CGFloat = lineHeight + spacing
            let rect = CGRect(x: frame.origin.x, y: frame.origin.y + CGFloat(index) * spacingAndHeight, width: frame.width, height: lineHeight)
            let subviewPath = UIBezierPath(rect: rect)
            path.append(subviewPath)
        }
    }
}

extension UITextView: CanBeMultipleLines {
    
    @IBInspectable public var lineHeight: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.MultiLine.lineHeight) as? CGFloat ?? DefaultValue.MultipleLine.lineHeight }
        set { objc_setAssociatedObject(self, &AssociatedKeys.MultiLine.lineHeight, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }

    @IBInspectable public var spacing: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.MultiLine.lineSpacing) as? CGFloat ?? DefaultValue.MultipleLine.lineSpacing }
        set { objc_setAssociatedObject(self, &AssociatedKeys.MultiLine.lineSpacing, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
}

