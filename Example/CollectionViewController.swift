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

    @IBOutlet weak var collectionView: WindlessCollectionView!
    var flag = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "collection"
        collectionView.windless(flag)
    }
    
    @IBAction func tapped(_ sender: Any) {
        flag = !flag
        collectionView.windless(flag)
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 2
        return CGSize(width: width, height: 158)
    }
}
