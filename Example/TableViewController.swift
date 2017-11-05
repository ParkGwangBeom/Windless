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
    var flag = false {
        didSet {
            tableView.reloadData()
        }
    }
    var randoms: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10 {
            let random = arc4random() % 2
            randoms.append(Int(random))
        }
        
        flag = true
    }
    
    @IBAction func tapped(_ sender: Any) {
        flag = !flag
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell\(randoms[indexPath.row])"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! TestCell
        cell.windView.windless = flag
        return cell
    }
}

class TestCell: UITableViewCell {
    
    @IBOutlet weak var windView: WindlessView!
    
    @IBOutlet weak var view1: UIImageView!
    @IBOutlet weak var view2: UILabel!
    @IBOutlet weak var view3: UILabel!
    @IBOutlet weak var view4: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupWindless()
    }
    
    func setupWindless() {
        windView.tleCornerRadius = 5
        windView.duration = 1.5
        windView.pauseDuration = 2
        windView.beginTime = 1
        windView.coverViews = [view1, view2, view3, view4]
    }
}
