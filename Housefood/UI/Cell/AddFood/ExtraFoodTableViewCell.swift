//
//  ExtraFoodTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/11/19.
//  Copyright © 2019 Oluha. All rights reserved.
//


import UIKit

class ExtraFoodTableViewCell: UITableViewCell {
    
    @IBOutlet weak var txtFoodName: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    
    var deleteButtonDelegate: ((Int) -> ())?
    var currentIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtPrice.layer.addBorder(edge: UIRectEdge.left, color: UIColor.init(hexString: "#3B3B3B"), thickness: 0.5, borderHeight: txtPrice.bounds.height - 7)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObject(extraFood: ExtraFood, index: Int) {
//        txtFoodName.text   = extraFood.name
//        txtPrice.text      = String(extraFood.price)
        currentIndex       = index
    }
    
    @IBAction func btnClickedClose(_ sender: UIButton) {
        deleteButtonDelegate?(currentIndex)
    }}

