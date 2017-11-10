//
//  CAMediaTimingFunction+Windless.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 8..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

public extension CAMediaTimingFunction {
    
    static let linear = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
    
    static let easeIn = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseIn)
    
    static let easeOut = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    
    static let easeInOut = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
}
