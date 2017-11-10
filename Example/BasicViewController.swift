//
//  ViewController.swift
//  Example
//
//  Created by gwangbeom on 2017. 10. 26..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit
import Windless

class BasicViewController: UIViewController {

    @IBOutlet weak var view1: UIImageView!
    @IBOutlet weak var view2: UILabel!
    @IBOutlet weak var view3: UILabel!
    @IBOutlet weak var view4: UIImageView!
    @IBOutlet weak var view5: UILabel!
    @IBOutlet weak var view6: UILabel!
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Basic"
        
        view.windless
            .setupWindlessableViews([view2, view3, view5, view6])
            .apply {
                $0.direction = .right
                $0.beginTime = 1
                $0.duration = 3
                $0.animationLayerOpacity = 0.5
                $0.cornerRadius = 3
            }
            .start()
        
    }
    
    @IBAction func tapped(_ sender: Any) {
        flag = !flag
        flag ? view.windless.start() : view.windless.end()
    }
}
