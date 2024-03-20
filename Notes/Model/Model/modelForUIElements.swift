//
//  modelForUIElements.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 14/05/23.
//

import UIKit

class modelForUIElements: UIViewController {
    
    func textField(_ placeholder: String?, _ textColor: UIColor, _ backColor: UIColor, _ font: UIFont) -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = backColor
        textField.font = font
        textField.textColor = textColor
        if let placeholder = placeholder {
            textField.placeholder = placeholder
        }
        return textField
    }
    func Btn(_ backColor: UIColor, _ text: String?, _ textColor: UIColor) -> UIButton {
        let btn = UIButton(type: .system)
        btn.backgroundColor = backColor
        btn.setTitleColor(textColor, for: .normal)
        if let title = text {
            btn.setTitle(title, for: .normal)
        }
        return btn
    }
    
}
