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
            .setupContainer([view1, view2, view3, view4, view5, view6])
            .apply {
                $0?.beginTime = 1
                $0?.duration = 3
                $0?.animationLayerColor = .red
            }
            .start()
        
    }
    
    @IBAction func tapped(_ sender: Any) {
        flag = !flag
        flag ? view.windless.start() : view.windless.end()
    }
}
