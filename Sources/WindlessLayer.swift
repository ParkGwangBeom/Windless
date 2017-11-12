//
//  WindlessLayer.swift
//  Windless-iOS
//
//  Created by gwangbeom on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

class WindlessLayer: CALayer {
    
    private var context: WindlessContext
    init(frame: CGRect, context: WindlessContext) {
        self.context = context
        super.init()
        self.frame = frame
        addSublayer(context.animationLayer)
        addSublayer(context.coverLayer)
        Maker.makeNotWindlessableLayers(in: context.container).forEach {
            context.coverLayer.addSublayer($0)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        context.updateLayerFrame(bounds)
        context.updateMask()
    }
}
