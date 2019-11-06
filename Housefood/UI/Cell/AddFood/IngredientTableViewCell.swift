//
//  IngredientTableViewCell.swift
//  Housefood
//
//  Created by Oluha group on 8/2/19.
//  Copyright © 2019 Oluha. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

    @IBOutlet weak var txtDate: UITextField!
    @IBOutlet weak var txtIngredientName: UITextField!
    private var datePicker = UIDatePicker()
    
    var deleteButtonDelegate: ((Int) -> ())?
    var currentIndex = 0
    private var currentIngredient : Ingredient?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        txtIngredientName.delegate = self
        txtDate.delegate           = self
        
        txtDate.layer.addBorder(edge: UIRectEdge.left, color: UIColor.init(hexString: "#3B3B3B"), thickness: 0.5, borderHeight: txtDate.bounds.height - 22) //temparey fixed for 17
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.dateChanged(datePicker:)), for: .valueChanged)
        txtDate.inputView = datePicker

        let toolBar = UIToolbar().ToolbarPiker(mySelect: #selector(IngredientTableViewCell.dismissPick))
        txtDate.inputAccessoryView = toolBar
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        txtDate.text = dateFormatter.string(from: datePicker.date)
        currentIngredient?.date = txtDate.text ?? ""
    }
    
    @objc func dismissPick() {
        contentView.endEditing(true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setObject(ingredient: Ingredient, index: Int) {
        txtDate.text            = ingredient.date
        txtIngredientName.text  = ingredient.name
        currentIndex = index
        currentIngredient = ingredient
    }
    
    @IBAction func btnClickedClose(_ sender: UIButton) {
        deleteButtonDelegate?(currentIndex)
    }
    
}

extension IngredientTableViewCell : UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        currentIngredient?.name = txtIngredientName.text ?? ""
    }
}
