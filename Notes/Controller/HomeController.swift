//
//  HomeController.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 14/05/23.
//

import UIKit
import SideMenu
import QuartzCore
import CoreData
import AVFoundation

let wd = UIScreen.main.bounds.width
let hg = UIScreen.main.bounds.height

class HomeController: UIViewController {
    
    let tableview = UITableView()
    var sideMenu: SideMenuNavigationController?
    var NoteLists = [NoteItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        navigationController?.setNavigationBarHidden(false, animated: false)
        view.backgroundColor = .systemGray5
        navBarDesign()
        navBarButtons()
        sideMenuDesign()
        
        tableview.backgroundColor = .clear
        tableview.separatorStyle = .none
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(Cell_View.self, forCellReuseIdentifier: "cell")
        view.addSubview(tableview)
        tableview.snp.makeConstraints { make in
            make.left.right.bottom.equalTo(0)
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        tableview.reloadData()
    }
}
extension HomeController {
    
    func sideMenuDesign() {
        sideMenu = SideMenuNavigationController(rootViewController: sideMenuCell())
        sideMenu?.leftSide = true
        sideMenu?.setNavigationBarHidden(false, animated: false)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: self.view)
    }
    
    func navBarDesign() {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.text = "Notes"
        navigationItem.titleView = label
    }
    func navBarButtons() {
        let leftBtn = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3")?.withRenderingMode(.alwaysTemplate),
                                      style: .done,
                                      target: self,
                                      action: #selector(leftBtnClick))
        leftBtn.tintColor = .white
        navigationItem.leftBarButtonItem = leftBtn
        
        let rightBtn = UIBarButtonItem(image: UIImage(systemName: "plus"),
                                       style: .done,
                                       target: self,
                                       action: #selector(rightBtnClick))
        rightBtn.tintColor = .white
        navigationItem.rightBarButtonItem = rightBtn
    }
    @objc func leftBtnClick(_ sender: UITabBarItem) {
        present(sideMenu!, animated: true)
    }
    @objc func rightBtnClick(_ sender: UITabBarItem) {
        let vs = CreateNewNote()
        navigationController?.pushViewController(vs, animated: true)
    }    
}

extension HomeController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NoteLists = CoreDataFunc().getAllItem()
        return NoteLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Note = NoteLists[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! Cell_View
        cell.initdata(Note.createData ?? "22", Note.nameNote ?? " ")
        cell.tableView = tableView
        cell.note = Note
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let writeVC = writeNote()
        writeVC.thisNote = NoteLists[indexPath.row]
        writeVC.pageName = NoteLists[indexPath.row].nameNote
        navigationController?.pushViewController(writeVC, animated: true)
    }
}




