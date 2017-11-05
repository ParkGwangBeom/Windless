//
//  ViewController.swift
//  Example
//
//  Created by gwangbeom on 2017. 10. 26..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit
import Windless

class ViewController: UIViewController {

    @IBOutlet weak var toggleButton: UIBarButtonItem!
    @IBOutlet weak var windlessView: WindlessView!
    
    @IBOutlet weak var view1: UIImageView!
    @IBOutlet weak var view2: UILabel!
    @IBOutlet weak var view3: UILabel!
    @IBOutlet weak var view4: UIImageView!
    @IBOutlet weak var view5: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        windlessView.coverViews = [view1, view2, view3, view4, view5]
    }
    
    
    
    @IBAction func toggle(_ sender: Any) {
        windlessView.windless = !windlessView.windless
    }
}
