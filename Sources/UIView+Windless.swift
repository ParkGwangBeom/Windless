//
//  UIView+Windless.swift
//  Windless-iOS
//
//  Created by NAVER on 2017. 11. 8..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

public extension UIView {
    
    private struct AssociatedKeys {
        static var isWindlessableKey = "isWindlessableKey"
        static var windlessKey = "windlessKey"
    }
    
    @IBInspectable var isWindlessable: Bool {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.isWindlessableKey) as? Bool ?? false }
        set { objc_setAssociatedObject(self, &AssociatedKeys.isWindlessableKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var windless: Windless {
        guard let windless = objc_getAssociatedObject(self, &AssociatedKeys.windlessKey) as? Windless else {
            let windless = Windless(contentsView: self)
            objc_setAssociatedObject(self, &AssociatedKeys.windlessKey, windless, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return windless
        }
        return windless
    }
}
