//
//  ViewController.swift
//  Apple Products
//
//  Created by Eureka Tatsu on 12/11/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   

    
    var categoryArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" )]
    
    var popularArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2")]
    
    var categoryLabel = [ "one", "two", "three", "four", "one", "two", "three", "four" ]
    var popularLabel = ["Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020", "Iphone 11",
                        "Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020", "Iphone 11",
                        "Iphone 11 pro max", "Ipad pro 2020"]
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.isScrollEnabled = false
        
        var layout = self.popularCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets (top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize (width: (self.popularCollectionView.frame.size.width -  20) / 2, height: self.popularCollectionView.frame.size.height / 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.categoryCollectionView {
            return categoryArray.count
        }
        return popularArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoryCollectionView {
            let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
            categoryCell.categoryImage.image = categoryArray[indexPath.row]
            categoryCell.categoryLabel.text = categoryLabel[indexPath.row]
            return categoryCell
        } else {
            let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
            popularCell.popularImage.image = popularArray[indexPath.row]
            popularCell.popularLabel.text = popularLabel[indexPath.row]
            return popularCell
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        collectionView.deselectItem(at: indexPath, animated: true)
//        if collectionView == self.categoryCollectionView {
//            let categoryCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
//            categoryCell.categoryImage.image = categoryArray[indexPath.row]
//            categoryCell.categoryLabel.text = categoryLabel[indexPath.row]
//            return categoryCell
//        } else {
//            let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
//            popularCell.popularImage.image = popularArray[indexPath.row]
//            popularCell.popularLabel.text = popularLabel[indexPath.row]
//            return popularCell
//        }
//
    }
    


//}

