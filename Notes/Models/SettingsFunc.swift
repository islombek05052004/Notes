//
//  SettingsFunc.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 22/05/23.
//

import UIKit

class SettingsFunc {
    
    var darkMode = UserDefaults.standard
    let key = "darkMode"
    
    func darkModeSet(_ bool : Bool)  {
        darkMode.removeObject(forKey: key)
        darkMode.set(bool, forKey: key)
    }
    func darkModeGet() -> Bool {
        darkMode.value(forKey: key) as? Bool ?? false
    }
    
    func darkModeColors(_ bool : Bool) -> [UIColor] {
        var ArrColor = [UIColor]()
        let VCDarkModeColor = UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1)
        let Btn_TF_Nav_SD_DarkModeColor = UIColor(red: 54/255, green: 56/255, blue: 56/255, alpha: 1)
        let TextDarkModeColor = UIColor(red: 166/255, green: 170/255, blue: 171/255, alpha: 1)
        
        let Text_Btn_SD_Color = UIColor.white
        let NavColor = UIColor.orange
        let TextSD = UIColor.black
        let TF_Color = UIColor.systemGray
        if bool == true {
            ArrColor = [VCDarkModeColor, Btn_TF_Nav_SD_DarkModeColor, TextDarkModeColor]
        } else {
            ArrColor = [Text_Btn_SD_Color, NavColor, TextSD, TF_Color]
        }
        return ArrColor
    }
}

