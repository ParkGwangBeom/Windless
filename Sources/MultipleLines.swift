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
    func appendMultilineLayersPath(on path: UIBezierPath, frame: CGRect) {
        let numberOfLines = Int(round(frame.height / (lineHeight + spacing)))
        for index in 0..<numberOfLines {
            let spacingAndHeight: CGFloat = lineHeight + spacing
            let offset = self is UILabel ? (frame.height - lineHeight) / 2 : 0  // label일 경우만 center 정렬해 줄 수 있도록
            let rect = CGRect(x: frame.origin.x, y: frame.origin.y + offset + CGFloat(index) * spacingAndHeight, width: frame.width, height: lineHeight)
            let subviewPath = UIBezierPath(rect: rect)
            path.append(subviewPath)
        }
    }
}

extension UILabel: CanBeMultipleLines {
    
    @IBInspectable public var lineHeight: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.MultiLine.lineHeight) as? CGFloat ?? DefaultValue.MultipleLine.lineHeight }
        set { objc_setAssociatedObject(self, &AssociatedKeys.MultiLine.lineHeight, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    // 삭제시킬 방법이 필요 할 듯
    public var spacing: CGFloat {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.MultiLine.lineSpacing) as? CGFloat ?? DefaultValue.MultipleLine.lineSpacing }
        set { objc_setAssociatedObject(self, &AssociatedKeys.MultiLine.lineSpacing, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
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

