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
    var letters = ["A","R","T","C","O","D","E"]
    @IBOutlet weak var collection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0...(colors.count/letters.count) {
            labels.append(contentsOf: letters)
        }
        
        collection.reloadData()
    }
}

extension ArtCodeCollectionViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        colors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collection.dequeueReusableCell(withReuseIdentifier: "TextCollectionViewCell", for: indexPath) as! TextCollectionViewCell
        cell.label.text = labels[indexPath.item]
        cell.label.textColor = .white
        cell.contentView.backgroundColor = colors[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collection.frame.size.width/20, height: self.collection.frame.size.width/20)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    

}
