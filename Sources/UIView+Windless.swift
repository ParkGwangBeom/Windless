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
        static var isWindlessable = "isWindlessableKey"
        static var windless = "windlessKey"
    }
    
    @IBInspectable var isWindlessable: Bool {
        get { return objc_getAssociatedObject(self, &AssociatedKeys.isWindlessable) as? Bool ?? false }
        set { objc_setAssociatedObject(self, &AssociatedKeys.isWindlessable, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
    var windless: Windless {
        guard let windless = objc_getAssociatedObject(self, &AssociatedKeys.windless) as? Windless else {
            let windless = Windless(contentsView: self)
            objc_setAssociatedObject(self, &AssociatedKeys.windless, windless, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return windless
        }
        return windless
    }
}
