//
//  CoreDataFunc.swift
//  Notes
//
//  Created by Abdurazzoqov Islombek on 22/05/23.
//

import UIKit
 
class CoreDataFunc {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func getAllItem() -> [NoteItem] {
        do {
            let noteArr = try context.fetch(NoteItem.fetchRequest())
            return noteArr
        }
        catch {
            return [NoteItem]()
        }
    }
    func createItem(_ name: String, _ createData: String) {
        let newItem = NoteItem(context: context)
        newItem.nameNote = name
        newItem.textNote = ""
        newItem.createData = createData
        do {
            try context.save()
        }
        catch {
            
        }
    }
    func deleteItem(_ item: NoteItem) {
        context.delete(item)
        do {
            try context.save()
        }
        catch {
        }
    }
    func updateItem(_ item: NoteItem, _ text: String?) {
        item.textNote = text ?? ""
        do {
            try context.save()
        }
        catch {
        }
    }
}
