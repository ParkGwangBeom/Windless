//
//  TableViewController.swift
//  Example
//
//  Created by gwangbeom on 2017. 10. 26..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit
import Windless

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    lazy var randoms: [Int] = {
        var values: [Int] = []
        for _ in 0..<10 {
            let random = arc4random() % 2
            values.append(Int(random))
        }
        return values
    }()
    
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Table"
        tableView.windless
            .apply {
                $0.beginTime = 2
                $0.duration = 3
                $0.animationLayerOpacity = 0.5
                $0.cornerRadius = 3
            }
            .start()
    }
    
    @IBAction func tapped(_ sender: Any) {
        flag = !flag
        flag ? tableView.windless.start() : tableView.windless.end()
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell\(randoms[indexPath.row])"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TestCell
        return cell
    }
}

class TestCell: UITableViewCell {
    
    @IBOutlet weak var view1: UIImageView!
    @IBOutlet weak var view2: UILabel!
    @IBOutlet weak var view3: UILabel!
    @IBOutlet weak var view4: UILabel!
}
