//
//  YourFoodsTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/20/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class YourFoodsTableViewCell: UITableViewCell {

    @IBOutlet weak var foodsCollectionView: UICollectionView!
    var addFoodClicked: (() -> ())?

    fileprivate var platesArray = [Plate]()

    override func awakeFromNib() {
        super.awakeFromNib()
                
        foodsCollectionView?.register(UINib(nibName: NibName.ChefItemCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: ReuseIdentifiers.ChefItemCollectionViewCell)
        foodsCollectionView?.register(UINib(nibName: NibName.AddMealCollectionViewCell, bundle: nil), forCellWithReuseIdentifier: ReuseIdentifiers.AddMealCollectionViewCell)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObjects(items: [Plate]) {
        platesArray = items
        foodsCollectionView.reloadData()
    }
}

extension YourFoodsTableViewCell : UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return platesArray.count+1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifiers.AddMealCollectionViewCell, for: indexPath as IndexPath) as! AddMealCollectionViewCell
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReuseIdentifiers.ChefItemCollectionViewCell, for: indexPath as IndexPath) as! ChefItemCollectionViewCell
            cell.setObject(item: platesArray[indexPath.row-1])
            return cell
        }
    }
    
}

extension YourFoodsTableViewCell : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            addFoodClicked!()
            //self.present(UIStoryboard(name: "AddFood", bundle: nil).instantiateInitialViewController()!, animated: true, completion: nil)
            //performSegue(withIdentifier: NamedSegues.SegueToAddFood, sender: nil)
        }
    }
    
}

extension YourFoodsTableViewCell : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 235)
    }
}
