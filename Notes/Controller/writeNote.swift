//
//  writeNote.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 22/05/23.
//

import UIKit
import CoreData

class writeNote: UIViewController {
    
    var textView = UITextView()
    var thisNote: NoteItem? = nil
    var pageName: String?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray5
        
        textView.delegate = self
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 20, weight: .regular)
        textView.frame = CGRect(x: 0, y: 0.13*hg, width: wd, height: 0.8*hg)
        textView.textColor = .black
        textView.textAlignment = .left
        textView.autocorrectionType = .no
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 10)
        
        if thisNote != nil {
            pageName = thisNote?.nameNote
            textView.text = thisNote?.textNote
        }
        view.addSubview(textView)
        design()
    }
   
    func design() {
        let label = UILabel()
        label.textColor = .white
        label.text = pageName ?? ""
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        navigationItem.titleView = label
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "chevron.backward")?.withRenderingMode(.alwaysTemplate),
            style: .plain,
            target: self,
            action: #selector(backClick))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }

    @objc func backClick(_ sender : UIBarButtonItem) {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "NoteItem")
        do {
            let rezults: NSArray = try context.fetch(request) as NSArray
            for rezult in rezults {
                let note = rezult as! NoteItem
                if note == thisNote {
                    note.textNote = textView.text
                    try context.save()
                }
            }
        } catch  {
            print("Failed")
        }
        navigationController?.popViewController(animated: true)
    }
}
extension writeNote: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        UIView.animate(withDuration: 0.2) {
            textView.snp.makeConstraints { make in
                make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
                make.left.right.equalTo(0)
                if #available(iOS 15.0, *) {
                    make.bottom.equalTo(textView.keyboardLayoutGuide.snp.top).offset(-10)
                } else {
                    
                }
            }
        }
    }
}
