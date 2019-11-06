//
//  AddFoodViewController.swift
//  Housefood
//
//  Created by Oluha group on 8/2/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var txtFoodName: UITextField!
    @IBOutlet weak var txtFoodDescription: UITextField!
    @IBOutlet weak var txtViewDescription: UIView!
    @IBOutlet weak var tblIngredients: UITableView!
    @IBOutlet weak var tblFoodImages: UITableView!
    @IBOutlet weak var tblAddExtraFood: UITableView!
    @IBOutlet weak var constraintIngredientsTableHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintAddExtraFoodTableHeight: NSLayoutConstraint!
    @IBOutlet weak var btnPostFood: ChefButton!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtTimeFrom: UITextField!
    @IBOutlet weak var txtTimeTo: UITextField!
    @IBOutlet weak var btnFreeDelivery: UIButton!
    @IBOutlet weak var btnPaidDelivery: UIButton!
    
    //MARK: Properties
    let addRowCellHeight = 38
    let photoItemCellHeight = 80

    private var ingredientsArray = [Ingredient]()
    private var extraFoodArray = [ExtraFood]()
    private var photoItemArray = [PhotoItem]()
    private var viewModel = AddFoodViewModel()
    
    var isAddFood: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.title = isAddFood ? Strings.PostAFood : Strings.EditAFood
        setTableViews()
        setData()
    }
    
    fileprivate func setData() {
        photoItemArray.append(PhotoItem(title: Strings.AddFoodImagePlate, image: #imageLiteral(resourceName: "UploadCloud"), url: ""))
        photoItemArray.append(PhotoItem(title: Strings.AddFoodImageKitchen, image: #imageLiteral(resourceName: "UploadCloud"), url: ""))
        photoItemArray.append(PhotoItem(title: Strings.AddFoodImageReciept, image: #imageLiteral(resourceName: "UploadCloud"), url: ""))

        if isAddFood {
            ingredientsArray.append(Ingredient())
            ingredientsArray.append(Ingredient())
            ingredientsArray.append(Ingredient())

            extraFoodArray.append(ExtraFood(name: "", price: 0))
            extraFoodArray.append(ExtraFood(name: "", price: 0))
            extraFoodArray.append(ExtraFood(name: "", price: 0))

        } else {
            
        }
        
        setIngredientTableHeight()
        setAddExtraFoodTableHeight()
        tblAddExtraFood.reloadData()
        tblIngredients.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    fileprivate func setTableViews() {
        tblIngredients.register(UINib(nibName: NibName.IngredientTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.IngredientTableViewCell)
        tblFoodImages.register(UINib(nibName: NibName.FoodImageTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.FoodImageTableViewCell)
        tblAddExtraFood.register(UINib(nibName: NibName.ExtraFoodTableViewCell, bundle: nil), forCellReuseIdentifier: ReuseIdentifiers.ExtraFoodTableViewCell)
    }
    
    fileprivate func deleteIngredient(index: Int) {
        ingredientsArray.remove(at: index)
        setIngredientTableHeight()
        tblIngredients.reloadData()
    }
    
    fileprivate func deleteExtraFood(index: Int) {
        extraFoodArray.remove(at: index)
        setAddExtraFoodTableHeight()
        tblAddExtraFood.reloadData()
    }
    
    fileprivate func setIngredientTableHeight() {
        constraintIngredientsTableHeight.constant = CGFloat(addRowCellHeight * ingredientsArray.count)
    }
    
    fileprivate func setAddExtraFoodTableHeight() {
        constraintAddExtraFoodTableHeight.constant = CGFloat(addRowCellHeight * extraFoodArray.count)
    }
    
    //MARK: Actions
    @IBAction func btnClickAddExtraFood(_ sender: Any) {
        extraFoodArray.append(ExtraFood(name: "", price: 0 ))
        setAddExtraFoodTableHeight()
        tblAddExtraFood.reloadData()
    }
    
    @IBAction func btnClickedAddRow(_ sender: UIButton) {
        ingredientsArray.append(Ingredient())
        setIngredientTableHeight()
        tblIngredients.reloadData()
    }
    
    @IBAction func btnAddFoodClicked(_ sender: UIButton) {
        viewModel.newPlate.name = txtFoodName.text
        viewModel.newPlate.description = txtFoodDescription.text
        viewModel.newPlate.price = Double(txtPrice.text ?? "")
        viewModel.newPlate.delivery_time = (Int(txtTimeFrom.text ?? "")! + Int(txtTimeTo.text ?? "")!)/2
        viewModel.newPlate.ingredients = ingredientsArray
        
        viewModel.getPlates(callback: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addImageVC = segue.destination as? AddFoodImageViewController {
            addImageVC.selectedImageItem = sender as? PhotoItem
        }
    }

}

extension AddFoodViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tblIngredients {
            return ingredientsArray.count
        } else if tableView == tblFoodImages {
            return photoItemArray.count
        } else if tableView == tblAddExtraFood {
            return extraFoodArray.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == tblIngredients {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.IngredientTableViewCell, for: indexPath) as! IngredientTableViewCell
            cell.setObject(ingredient: ingredientsArray[indexPath.row], index: indexPath.row)
            cell.deleteButtonDelegate = { (index) in
                self.deleteIngredient(index: index)
            }
            return cell
        } else if tableView == tblFoodImages {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.FoodImageTableViewCell, for: indexPath) as! FoodImageTableViewCell
            cell.setObject(item: photoItemArray[indexPath.row])
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ReuseIdentifiers.ExtraFoodTableViewCell, for: indexPath) as! ExtraFoodTableViewCell
            cell.setObject(extraFood: extraFoodArray[indexPath.row], index: indexPath.row)
            cell.deleteButtonDelegate = { (index) in
                self.deleteExtraFood(index: index)
            }
            return cell
        }
    }
    
}

extension AddFoodViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == tblIngredients {
            return CGFloat(addRowCellHeight)
        } else if tableView == tblFoodImages {
            return CGFloat(photoItemCellHeight)
        } else {
            return CGFloat(addRowCellHeight)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == tblFoodImages {
            performSegue(withIdentifier: NamedSegues.SegueToAddFoodToAddImage, sender: photoItemArray[indexPath.row])
        }
    }
}

extension AddFoodViewController : UIAddFoodDelegate {
    
    func onAddFoodSuccess() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func onAddFoodFailed(reason: String) {
        print(reason)
    }
    
}
