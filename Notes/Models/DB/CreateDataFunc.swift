//
//  CreateDataFunc.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 23/05/23.
//

import UIKit

class CreateDataFunc {
    
    func CreateData() -> String {
        let dataPicker = UIDatePicker()
        dataPicker.locale = .current
        dataPicker.datePickerMode = .dateAndTime
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        formatter.timeZone = .current
        return "\(formatter.string(from: dataPicker.date))"
    }
    
}
