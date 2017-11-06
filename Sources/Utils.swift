//
//  Utils.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

private let key = "isWindless_Key"

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
