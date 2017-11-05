//
//  ListViewController.swift
//  Example
//
//  Created by gwangbeom on 2017. 11. 5..
//  Copyright © 2017년 Windless. All rights reserved.
//

import UIKit

enum Items: String {
    case origin
    case table
    case collection
    
    static var all: [Items] {
        return [.origin, .table, .collection]
    }
}

class ListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Items.all.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = Items.all[indexPath.row].rawValue
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Items.all[indexPath.row].rawValue, sender: nil)
    }
}
