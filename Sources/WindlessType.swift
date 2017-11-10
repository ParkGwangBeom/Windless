//
//  WindlessType.swift
//  Example
//
//  Created by gwangbeom on 2017. 11. 7..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

protocol WindlessType {
    
    //! @abstract The direction of windless animation. Defaults to rightDiagonal.
    var direction: WindlessDirection { get set }

    //! @abstract The speed of windless animation. Defaults to 1.
    var speed: Float { get set }
    
    //! @abstract The duration of the fade used when windless begins. Defaults to 0.
    var beginTime: CFTimeInterval { get set }
    
    //! @abstract The time interval windless in seconds. Defaults to 4.
    var duration: CFTimeInterval { get set }
    
    //! @abstract The time interval between windless in seconds. Defaults to 2.
    var pauseDuration: CFTimeInterval { get set }
    
    //! @abstract gradient animation timingFunction default easeOut
    var timingFuction: CAMediaTimingFunction { get set }
    
    //! @abstract gradient layer center color default .lightGray
    var animationLayerColor: UIColor { get set }
    
    //! @abstract mask layer background color default .groupTableViewBackground
    var animationBackgroundColor: UIColor { get set }
    
    //! @abstract The opacity of the content while it is windless. Defaults to 0.8.
    var animationLayerOpacity: CGFloat { get set}
    
    //! @abstract mask layer cornerRadius default 4
    var cornerRadius: CGFloat { get set }
}
