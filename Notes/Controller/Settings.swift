//
//  Settings.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 22/05/23.
//

import UIKit

class Settings : UIViewController {
    
    let darkModeLabel = UILabel()
    let switchCase = UISwitch()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        darkModeLabel.text = "  Dark Mode"
        darkModeLabel.font = .systemFont(ofSize: 22, weight: .semibold)
        darkModeLabel.textColor = .black
        darkModeLabel.backgroundColor = .white
        darkModeLabel.clipsToBounds = true
        darkModeLabel.layer.cornerRadius = 0.02*wd
        view.addSubview(darkModeLabel)
        darkModeLabel.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(50)
        }
        switchCase.isOn = SettingsFunc().darkModeGet()
        switchCase.addTarget(self, action: #selector(switchCaseValue), for: .valueChanged)
        view.addSubview(switchCase)
        switchCase.snp.makeConstraints { make in
            make.right.equalTo(darkModeLabel.snp.right).offset(-20)
            make.centerY.equalTo(darkModeLabel.snp.centerY)
        }
        navBarButtons()
    }
}
extension Settings {
    
    func navBarButtons() {
        let leftBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate),
                                      style: .done,
                                      target: self,
                                      action: #selector(leftBtnClick))
        leftBtn.tintColor = .white
        navigationItem.leftBarButtonItem = leftBtn
    }
    
    @objc func leftBtnClick(_ sender: UITabBarItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func switchCaseValue(_ sender: UISwitch) {
        SettingsFunc().darkModeSet(switchCase.isOn)
    }
}
 
