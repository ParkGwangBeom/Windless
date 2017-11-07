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

//public enum WindlessShape: Int {
//    case diagonal
//    case straight
//}

protocol WindlessType {
    
    // gradient가 표현되는 부분 default .right
    var direction: WindlessDirection { get set }
    
    // gradient로 보여지는 부분의 모양 (대각선, 직선) default .diagonal
    //    var shape: WindlessShape { get set }
    
    // gradient 속도
    var speed: Float { get set }
    
    var beginTime: CFTimeInterval { get set }
    
    var duration: CFTimeInterval { get set }
    
    // 그라디언트 애니메이션이 지나가고 중간에 쉬는 시간
    var pauseDuration: CFTimeInterval { get set }
    
    var timingFuction: CAMediaTimingFunction { get set }
    
    // TODO 추후에
    //    var animationColors: [UIColor] { get set }
    
    var animationLayerColor: UIColor { get set }
    
    var animationBackgroundColor: UIColor { get set }
    
    var animationLayerOpacity: CGFloat { get set}
    
    var cornerRadius: CGFloat { get set }
}

private let WindlessableKey = "isWindless_Key"
private let WindlessKey = "Windless_Key"

public extension UIView {
    
    @IBInspectable
    var isWindlessable: Bool {
        get {
            return layer.value(forKey: WindlessableKey) as? Bool ?? false
        }
        set {
            layer.setValue(newValue, forKey: WindlessableKey)
        }
    }
    
    var windless: Windless {
        guard let windless = layer.value(forKey: WindlessKey) as? Windless else {
            let windless = Windless(contentsView: self)
            layer.setValue(windless, forKey: WindlessKey)
            return windless
        }
        return windless
    }
}
