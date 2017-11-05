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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        windlessView.show()
    }
    
    @IBAction func toggle(_ sender: Any) {
        toggleButton.title = windlessView.isAnimating ? "hide": "show"
        windlessView.isAnimating ? windlessView.hide() : windlessView.show()
    }
}
