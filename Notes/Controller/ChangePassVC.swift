//
//  ChangePassVC.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 21/05/23.
//
import UIKit

class ChangePassVC : UIViewController {
    
    var oldPass = UITextField()
    var newPass = UITextField()
    var repeatPass = UITextField()
    var oldPassHave: Bool? = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        navBarDesign()
        navBarButtons()
        titleViews()
        saveBtn()
    }
}

extension ChangePassVC {
    
    func navBarDesign() {
        let textBeforePass = "Create password"
        let textAfterPass = "Change password"
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        let passApp = pass_func().getPass()
        label.text = passApp.isEmpty == true ? textBeforePass : textAfterPass
        navigationItem.titleView = label
    }
    
    func navBarButtons() {
        let leftBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate),
                                      style: .done,
                                      target: self,
                                      action: #selector(leftBtnClick))
        leftBtn.tintColor = .white
        navigationItem.leftBarButtonItem = leftBtn
        let rightBtn = UIBarButtonItem(image: UIImage(systemName: "trash.fill")?.withRenderingMode(.alwaysTemplate),
                                       style: .done,
                                       target: self,
                                       action: #selector(rightBtnClick))
        rightBtn.tintColor = .white
        navigationItem.rightBarButtonItem = rightBtn
    }
    
    @objc func leftBtnClick(_ sender: UITabBarItem) {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func rightBtnClick(_ sender: UITabBarItem) {
        let alertVC = UIAlertController(title: "Delete", message: "Do you want to delete the password?", preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "Yes", style: .destructive, handler: { UIAlertAction in
            pass_func().removePass()
            self.navigationController?.popViewController(animated: true)
        }))
        alertVC.addAction(UIAlertAction(title: "No", style: .default))
        present(alertVC, animated: true)
    }
    
    
    func titleViews() {
        let pass = pass_func().getPass()

        oldPass = modelForUIElements().textField("Old password",
            .systemGray,
            .white,
            .systemFont(ofSize: 20, weight: .regular))
        oldPass.keyboardType = .numberPad
        oldPass.borderStyle = .roundedRect
        view.addSubview(oldPass)
        
        newPass = modelForUIElements().textField("New password",
            .systemGray,
            .white,
            .systemFont(ofSize: 20, weight: .regular))
        newPass.keyboardType = .numberPad
        newPass.borderStyle = .roundedRect
        view.addSubview(newPass)
        
        repeatPass = modelForUIElements().textField("Repeat password",
            .systemGray,
            .white,
            .systemFont(ofSize: 20, weight: .regular))
        repeatPass.borderStyle = .roundedRect
        repeatPass.keyboardType = .numberPad
        view.addSubview(repeatPass)
        
        if pass.isEmpty {
            newPass.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
                make.right.equalTo(-20)
                make.left.equalTo(20)
                make.height.equalTo(45)
            }
            repeatPass.snp.makeConstraints { make in
                make.top.equalTo(newPass.snp.bottom).offset(20)
                make.right.equalTo(-20)
                make.left.equalTo(20)
                make.height.equalTo(45)
            }
        } else {
            oldPassHave = true
            oldPass.snp.makeConstraints { make in
                make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
                make.right.equalTo(-20)
                make.left.equalTo(20)
                make.height.equalTo(45)
            }
            newPass.snp.makeConstraints { make in
                make.top.equalTo(oldPass.snp.bottom).offset(20)
                make.right.equalTo(-20)
                make.left.equalTo(20)
                make.height.equalTo(45)
            }
            repeatPass.snp.makeConstraints { make in
                make.top.equalTo(newPass.snp.bottom).offset(20)
                make.right.equalTo(-20)
                make.left.equalTo(20)
                make.height.equalTo(45)
            }
        }
    }
    
    func saveBtn() {
        let btn = modelForUIElements().Btn(.green, "Save", .white)
        btn.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 0.02*wd
        btn.addTarget(self, action: #selector(saveBtnClick), for: .touchUpInside)
        view.addSubview(btn)
        btn.snp.makeConstraints { make in
            make.top.equalTo(repeatPass.snp.bottom).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(40)
            make.centerX.equalTo(repeatPass.snp.centerX)
        }
    }
    
    @objc func saveBtnClick(_ sender: UIButton) {
        let pass = pass_func().getPass()
        if let oldPassText = oldPass.text, let newPassText = newPass.text, let repeatPassText = repeatPass.text {
            let newPassCount = newPassText.count
            let oldPassCount = oldPassText.count
            let repeatPassCount = repeatPassText.count

            if oldPassHave == true && pass == oldPassText && newPassText == repeatPassText && newPassCount == 4 && repeatPassCount == 4 && oldPassCount == 4 {
                pass_func().removePass()
                pass_func().setPass(newPassText)
                navigationController?.popViewController(animated: true)
            }
            if oldPassHave == false && newPassText == repeatPassText && newPassCount == 4 && repeatPassCount == 4 {
                pass_func().setPass(newPassText)
                navigationController?.popViewController(animated: true)
            } else {
                errorCountNumbers()
            }
        }
    }
    
    func errorCountNumbers() {
        let alertVC = UIAlertController(title: "Error",
                                        message: "The number of digits in the password must be four, or the password was entered incorrectly",
                                        preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertVC, animated: true)
    }
}
