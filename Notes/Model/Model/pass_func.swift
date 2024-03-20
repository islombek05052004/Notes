//
//  pass_func.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 14/05/23.
//

import Foundation

class pass_func {
    
    var passData = UserDefaults.standard
    let key = "pass"
   
    func getPass() -> String {
        let pass = passData.value(forKey: key)
        return pass as? String ?? ""
    }
    
    func setPass( _ newPass: String) {
        passData.set(newPass, forKey: key)
    }
    
    func removePass() {
        passData.removeObject(forKey: key)
    }
    
}
