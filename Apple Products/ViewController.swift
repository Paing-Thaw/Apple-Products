//
//  ViewController.swift
//  Apple Products
//
//  Created by Eureka Tatsu on 12/11/20.
//

import UIKit
import ImageSlideshow

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
   

    
    var categoryArray = [UIImage(named: "r1"), UIImage(named: "r2"), UIImage(named: "r3"), UIImage(named: "r4" ),UIImage(named: "r1"), UIImage(named: "r2"), UIImage(named: "r3"), UIImage(named: "r4" )]
    
    var popularArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2")]
    
    var categoryLabel = [ "iPad", "iPhone", "iWatch", "Earphones", "iPad", "iPhone", "iWatch", "Earphones" ]
    var popularLabel = ["Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020", "Iphone 11",
                        "Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020", "Iphone 11",
                        "Iphone 11 pro max", "Ipad pro 2020"]
    
    var newReleaseArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2")]
    var newReleaseLabel = ["Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020",
                           "Iphone 11", "Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020", "Iphone 11", "Iphone 11 pro max", "Ipad pro 2020"]
    
    var promotionArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2")]
    var promotionLabel = ["Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020",
                           "Iphone 11", "Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020", "Iphone 11", "Iphone 11 pro max", "Ipad pro 2020"]
    
    
    var iPadArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2")]
    var iPadLabel = ["Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020",
                           "Iphone 11", "Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020", "Iphone 11", "Iphone 11 pro max", "Ipad pro 2020"]
    
    
    var iPhoneArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4" ),UIImage(named: "1"), UIImage(named: "2")]
    var iPhoneLabel = ["Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020",
                           "Iphone 11", "Iphone 11 pro max", "Ipad pro 2020", "IPhone SE 2020", "Iphone 11", "Iphone 11 pro max", "Ipad pro 2020"]
    
    let localSource = [BundleImageSource(imageString: "1"), BundleImageSource(imageString: "2"), BundleImageSource(imageString: "3"), BundleImageSource(imageString: "4")]
    
    
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var popularCollectionView: UICollectionView!
  
    @IBOutlet weak var newReleaseCollectionView: UICollectionView!
    
    @IBOutlet weak var promotionCollectionView: UICollectionView!
    
    
    @IBOutlet weak var iPadCollectionView: UICollectionView!
    
    @IBOutlet weak var iPhoneCollectionView: UICollectionView!
    
    
    @IBOutlet weak var slideShow: ImageSlideshow!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        slideShow.slideshowInterval = 5.0
        slideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideShow.contentScaleMode = UIViewContentMode.scaleAspectFill
        slideShow.setImageInputs(localSource)

        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.lightGray
        pageControl.pageIndicatorTintColor = UIColor.black
        slideShow.pageIndicator = pageControl
        
        
        // Do any additional setup after loading the view.
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        popularCollectionView.isScrollEnabled = false
        newReleaseCollectionView.delegate = self
        newReleaseCollectionView.dataSource = self
        newReleaseCollectionView.isScrollEnabled = false
        
        let layout = self.popularCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets (top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize (width: (self.popularCollectionView.frame.size.width -  20) / 2, height: self.popularCollectionView.frame.size.height / 3)
        
        let newReleaseLayout = self.newReleaseCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        newReleaseLayout.sectionInset = UIEdgeInsets (top: 0, left: 10, bottom: 0, right: 10)
        newReleaseLayout.minimumInteritemSpacing = 5
        newReleaseLayout.itemSize = CGSize (width: (self.newReleaseCollectionView.frame.size.width -  20) / 2, height: self.newReleaseCollectionView.frame.size.height / 3)
        
        horizontalViewLayout(collectionViewName: self.promotionCollectionView)
        horizontalViewLayout(collectionViewName: self.iPadCollectionView)
        horizontalViewLayout(collectionViewName: self.iPhoneCollectionView)
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
        } else if collectionView == popularCollectionView {
            let popularCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
            popularCell.popularImage.image = popularArray[indexPath.row]
            popularCell.popularLabel.text = popularLabel[indexPath.row]
            popularCell.layer.cornerRadius = popularCell.frame.height / 2
            return popularCell
        } else if collectionView == newReleaseCollectionView {
            let newReleaseCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
            newReleaseCell.newReleaseImage.image = newReleaseArray[indexPath.row]
            newReleaseCell.newReleaseLabel.text = newReleaseLabel[indexPath.row]
            newReleaseCell.layer.cornerRadius = newReleaseCell.frame.height / 2
            return newReleaseCell
        } else if collectionView == promotionCollectionView {
            let promotionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
            promotionCell.promotionImage.image = promotionArray[indexPath.row]
            promotionCell.promotionLabel.text = promotionLabel[indexPath.row]
            return promotionCell
        } else if collectionView == iPadCollectionView {
            let iPadCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
            iPadCell.iPadImage.image = iPadArray[indexPath.row]
            iPadCell.iPadLabel.text = iPadLabel[indexPath.row]
            return iPadCell
        } else {
            let iPhoneCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
            iPhoneCell.iPhoneImage.image = iPhoneArray[indexPath.row]
            iPhoneCell.iPhoneLabel.text = iPhoneLabel[indexPath.row]
            return iPhoneCell
        }
    }
    

    
    func horizontalViewLayout(collectionViewName: UICollectionView) {
        let layout = collectionViewName.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets (top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize (width: (collectionViewName.frame.size.width -  2) / 10, height: collectionViewName.frame.size.height / 3)
    }



}
