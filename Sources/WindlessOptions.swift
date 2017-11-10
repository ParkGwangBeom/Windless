//
//  WindlessOptions.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 8..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

struct Location {
    var start: CGPoint
    var end: CGPoint
}

public enum WindlessDirection: Int {
    
    /// Windless animation goes from left to right
    case right
    
    /// Windless animation goes from left to right diagonal
    case rightDiagonal
    
    /// Windless animation goes from right to left
    case left
    
    /// Windless animation goes from right to left diagonal
    case leftDiagonal
    
    /// Windless animation goes from down to up
    case up
    
    /// Windless animation goes from up to down
    case down
    
    var location: Location {
        switch self {
        case .right:
            return Location(start: CGPoint(x: 0, y: 0.5), end: CGPoint(x: 1, y: 0.5))
        case .rightDiagonal:
            return Location(start: CGPoint(x: 0, y: 0.0), end: CGPoint(x: 1, y: 1))
        case .left:
            return Location(start: CGPoint(x: 1, y: 0.5), end: CGPoint(x: 0, y: 0.5))
        case .leftDiagonal:
            return Location(start: CGPoint(x: 1, y: 1), end: CGPoint(x: 0, y: 0))
        case .up:
            return Location(start: CGPoint(x: 0.5, y: 1), end: CGPoint(x: 0.5, y: 0))
        case .down:
            return Location(start: CGPoint(x: 0.5, y: 0), end: CGPoint(x: 0.5, y: 1))
        }
    }
}
