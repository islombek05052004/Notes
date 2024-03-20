//
//  Cell_View.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 14/05/23.
//

import UIKit
import AVFoundation
 
class Cell_View: UITableViewCell {
    
    let viewForElements = UIView()
    let title = UILabel()
    let createData = UILabel()
    var menu: UIContextMenuInteraction!
    var note: NoteItem?
    var tableView: UITableView!
    var avplayer = AVAudioPlayer()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        menu = UIContextMenuInteraction(delegate: self)
        contentView.backgroundColor = .systemGray5
        viewForElements.backgroundColor = .white
        viewForElements.layer.cornerRadius = 0.02*wd
        viewForElements.addInteraction(menu)
        contentView.addSubview(viewForElements)
        viewForElements.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(5)
            make.bottom.equalTo(-5)
        }
        title.textColor = .black
        title.font = .systemFont(ofSize: 20, weight: .regular)
        title.textAlignment = .left
        title.numberOfLines = 1
        viewForElements.addSubview(title)
        title.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(5)
            make.height.equalTo(22)
        }
        
        createData.textAlignment = .left
        createData.textColor = .black
        createData.font = .systemFont(ofSize: 14, weight: .regular)
        viewForElements.addSubview(createData)
        createData.snp.makeConstraints { make in
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.top.equalTo(title.snp.bottom).offset(2)
            make.height.equalTo(20)
            make.bottom.equalTo(viewForElements.snp.bottom).offset(-2)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initdata(_ createD: String, _ titleT: String) {
        createData.text = createD
        title.text = titleT
    }
}
extension Cell_View : UIContextMenuInteractionDelegate {
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil ) { (_) -> UIMenu? in
            let delete = UIAction(title: "Delete") { UIAction in
                guard let note = self.note else {return}
                CoreDataFunc().deleteItem(note)
                self.deleteNoteSound()
                self.tableView.reloadData()
            }
            return UIMenu(title: "Menu", children: [ delete])
        }
    }
    
    func deleteNoteSound() {
        let sound = Bundle.main.path(forResource: "delete", ofType: "mp3")
        do {
            avplayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            avplayer.play()
        } catch  {
            print("Error")
        }
    }
    
}
