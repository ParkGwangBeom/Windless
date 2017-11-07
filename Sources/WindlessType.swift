//
//  WindlessType.swift
//  Example
//
//  Created by gwangbeom on 2017. 11. 7..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

/*
 TODO
 - 기울기 적용하기
 - 넓이 계산하기
 - 색을 좀 더 커스텀 가능하도록 하기
 - 라벨의 경우 한줄일 때 높이와 줄 수를 지정할 수 있게 하기
 */

struct Location {
    var start: CGPoint
    var end: CGPoint
}

public enum WindlessDirection: Int {
    case right
    case rightDiagonal
    case left
    case leftDiagonal
    case up
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

protocol WindlessType {
    
    var direction: WindlessDirection { get set }

    var speed: Float { get set }
    
    var beginTime: CFTimeInterval { get set }
    
    var duration: CFTimeInterval { get set }
    
    var pauseDuration: CFTimeInterval { get set }
    
    var timingFuction: CAMediaTimingFunction { get set }
    
    // TODO 추후에
    //    var animationColors: [UIColor] { get set }
    
    var animationLayerColor: UIColor { get set }
    
    var animationBackgroundColor: UIColor { get set }
    
    var animationLayerOpacity: CGFloat { get set}
    
    var cornerRadius: CGFloat { get set }
}
