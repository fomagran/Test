//
//  ArtCodeCollectionViewController.swift
//  Test
//
//  Created by Fomagran on 2021/03/20.
//

import UIKit

class ArtCodeCollectionViewController: UIViewController {
    
    var colors = [UIColor]()
    var labels = [String]()
    var fomagran = ["F","O","M","A","G","R","A","N"]
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...(colors.count/8) {
            labels.append(contentsOf: fomagran)
        }
        print(labels)
        collection.reloadData()
    }
}

extension ArtCodeCollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "TextCollectionViewCell", for: indexPath) as! TextCollectionViewCell
        cell.label.text = labels[indexPath.item]
        cell.label.textColor = colors[indexPath.item]
        
        return cell
    }
    

}
