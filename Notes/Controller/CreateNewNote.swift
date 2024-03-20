//
//  CreateNewNote.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 20/05/23.
//
import UIKit
import AVFoundation

class CreateNewNote : UIViewController {
    var nameNoteTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        navBarDesign()
        navBarButtons()
        textFields()
        createBtn()
    }
}

extension CreateNewNote {
    func navBarDesign() {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Create new note"
        navigationItem.titleView = label
    }
    func navBarButtons() {
        let leftBtn = UIBarButtonItem(image: UIImage(systemName: "chevron.left")?.withRenderingMode(.alwaysTemplate),
                                      style: .done,
                                      target: self,
                                      action: #selector(leftBtnClick))
        leftBtn.tintColor = .white
        navigationItem.leftBarButtonItem = leftBtn
    }
    @objc func leftBtnClick(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
    func textFields() {
        nameNoteTF = modelForUIElements().textField("Create new file...",
                                                        .black,
                                                        .white,
                                                        .systemFont(ofSize: 22, weight: .regular))
        nameNoteTF.borderStyle = .roundedRect
        nameNoteTF.autocorrectionType = .no
        view.addSubview(nameNoteTF)
        nameNoteTF.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(20)
            make.height.equalTo(45)
        }
    }
    func createBtn() {
        let CreateBtn = modelForUIElements().Btn(.green, "Create", .white)
        CreateBtn.clipsToBounds = true
        CreateBtn.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        CreateBtn.layer.cornerRadius = 0.02 * wd
        CreateBtn.addTarget(self, action: #selector(createBtnClick), for: .touchUpInside)
        view.addSubview(CreateBtn)
        CreateBtn.snp.makeConstraints { make in
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(nameNoteTF.snp.bottom).offset(20)
            make.width.equalTo(80)
            make.height.equalTo(40)
        }
    }
    @objc func createBtnClick() {
        let createData = CreateDataFunc().CreateData()
        CoreDataFunc().createItem(nameNoteTF.text ?? " ", createData)
        navigationController?.popViewController(animated: true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        nameNoteTF.endEditing(true)
    }
}
