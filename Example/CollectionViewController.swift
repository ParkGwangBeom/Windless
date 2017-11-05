//
//  CollectionViewController.swift
//  Example
//
//  Created by gwangbeom on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit
import Windless

class CollectionViewController: UIViewController {

    var windless: WindlessView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        windless?.windless = true
    }

    func setupView() {
        let windless = WindlessView(frame: CGRect(x: 100, y: 100, width: 300, height: 300))
        windless.duration = 5
        windless.pauseDuration = 1
        windless.beginTime = 2
        windless.direction = 1
        view.addSubview(windless)
        self.windless = windless
        
        let view1 = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        view1.backgroundColor = UIColor.red
        windless.addSubview(view1)
        
        let view2 = UIView(frame: CGRect(x: 110, y: 110, width: 150, height: 150))
        view2.backgroundColor = UIColor.red
        windless.addSubview(view2)
        
        windless.coverViews = [view1, view2]
    }
}
