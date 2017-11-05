//
//  Windless.swift
//  Windless
//
//  Created by gwangbeom on {TODAY}.
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

/*
 TODO
 1. 테이블, 콜렉션일 경우 여러개를 한번에 할 수 있도록 만들기
 2. 기울기 적용하기
 3. 색을 좀 더 커스텀 가능하도록 하기
 4. 라벨의 경우 한줄일 때 높이와 줄 수를 지정할 수 있게 하기
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

public protocol Windless {
    
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
    
    // TODO 추후에
//    var animationColors: [UIColor] { get set }
    
    var animationLayerColor: UIColor { get set }
    
    var animationBackgroundColor: UIColor { get set }
    
    var animationLayerOpacity: CGFloat { get set}
    
    // 이부분은 그냥 기본 background color 따라가는게 맞을듯
    var coverLayerColor: UIColor { get set }
    
    var cornerRadius: CGFloat { get set }
}

