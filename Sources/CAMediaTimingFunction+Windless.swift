//
//  CAMediaTimingFunction+Windless.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 8..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

public extension CAMediaTimingFunction {
    
    static let linear = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
    
    static let easeIn = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeIn)
    
    static let easeOut = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
    
    static let easeInOut = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
}
