//
//  FoodMenuViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/3/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class FoodMenuViewController: UIViewController {

    @IBOutlet weak var collectionViewFoodMenu: UICollectionView!
    private var foodItems = [MenuOrder]()
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionViewItemSize()

        collectionViewFoodMenu?.register(UINib(nibName: NibName.FoodMenuCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: ReuseIdentifiers.FoodMenuCollectionViewCell)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
        AddDataToCollection()
    }
    
    private func setupCollectionViewItemSize() {
        collectionViewFoodMenu.contentInset = UIEdgeInsets(top: 5, left: 5, bottom: 10, right: 10)
        
        let collectionViewFLowLayout = UICollectionViewFlowLayout()
        
        collectionViewFLowLayout.itemSize = CGSize(width: (self.view.bounds.width - (collectionViewFoodMenu.contentInset.left + collectionViewFoodMenu.contentInset.right)) / 2, height: 220)
        collectionViewFLowLayout.minimumLineSpacing = 0
        collectionViewFLowLayout.minimumInteritemSpacing = 0
        collectionViewFoodMenu.collectionViewLayout = collectionViewFLowLayout
    }
    
    fileprivate func AddDataToCollection() {
        foodItems.append(MenuOrder(imgOrder: #imageLiteral(resourceName: "food3"), orderTitle: "Grilled Chicken", rating: "4.9(200)", eta: "15-20 min", status: "Delivery"))
        foodItems.append(MenuOrder(imgOrder: #imageLiteral(resourceName: "food2"), orderTitle: "Grilled Chicken", rating: "4.9(200)", eta: "10-20 min", status: "Delivery"))
        foodItems.append(MenuOrder(imgOrder: #imageLiteral(resourceName: "food1"), orderTitle: "Grilled Chicken", rating: "4.9(200)", eta: "10-15 min", status: "Delivery"))
        foodItems.append(MenuOrder(imgOrder: #imageLiteral(resourceName: "food4"), orderTitle: "Grilled Chicken", rating: "4.9(200)", eta: "15-20 min", status: "Delivery"))
        foodItems.append(MenuOrder(imgOrder: #imageLiteral(resourceName: "food3"), orderTitle: "Grilled Chicken", rating: "4.9(200)", eta: "05-15 min", status: "Delivery"))
        foodItems.append(MenuOrder(imgOrder: #imageLiteral(resourceName: "food2"), orderTitle: "Grilled Chicken", rating: "4.9(200)", eta: "15-20 min", status: "Delivery"))
        foodItems.append(MenuOrder(imgOrder: #imageLiteral(resourceName: "food1"), orderTitle: "Grilled Chicken", rating: "4.9(200)", eta: "10-20 min", status: "Delivery"))
    }

}

extension FoodMenuViewController : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return foodItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifiers.FoodMenuCollectionViewCell, for: indexPath as IndexPath) as! FoodMenuCollectionViewCell
        cell.setObject(item: foodItems[indexPath.row])
        return cell
    }
    
}

extension FoodMenuViewController : UICollectionViewDelegate {
    
}

extension FoodMenuViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: ((collectionView.bounds.width/2)-10), height: 210)
    }

}

class MenuOrder: NSObject {
    var imgOrder : UIImage
    var orderTitle: String
    var rating: String
    var eta: String
    var status: String
    
    init(imgOrder: UIImage, orderTitle: String, rating: String, eta: String, status: String) {
        self.imgOrder   = imgOrder
        self.orderTitle = orderTitle
        self.rating     = rating
        self.eta        = eta
        self.status     = status
    }
}
