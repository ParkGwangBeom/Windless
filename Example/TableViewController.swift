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
    var flag = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            self.flag = true
            self.tableView.reloadData()
        }
    }
}

extension TableViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flag ? 10 : 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TestCell
        
        if flag {
            cell.windView.hide()
            cell.backgroundColor = UIColor.blue
        }
        
        return cell
    }
}

class TestCell: UITableViewCell {
  
    @IBOutlet weak var windView: WindlessView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        windView.show()
    }
}
