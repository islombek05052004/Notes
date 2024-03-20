//
//  sideMenuCell.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 21/05/23.
//

import UIKit
class sideMenuCell: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "Password"
        cell.textLabel?.textColor = .black
        cell.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
        cell.backgroundColor = .white
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let changePassVC = ChangePassVC()
        navigationController?.pushViewController(changePassVC, animated: true)
    }
}
