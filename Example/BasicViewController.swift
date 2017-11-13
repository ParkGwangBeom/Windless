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

    @IBOutlet weak var contentsView: UIView!
    @IBOutlet weak var view1: UIImageView!
    @IBOutlet weak var view2: UILabel!
    @IBOutlet weak var view3: UILabel!
    @IBOutlet weak var view4: UIImageView!
    @IBOutlet weak var view5: UILabel!
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Basic"
        view4.layer.cornerRadius = view4.frame.width / 2
        
        contentsView.windless
            .start()
    }
    
    @IBAction func tapped(_ sender: Any) {
        flag = !flag
        flag ? contentsView.windless.start() : contentsView.windless.end()
    }
}
