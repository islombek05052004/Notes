//
//  NoteItem+CoreDataProperties.swift
//  
//
//  Created by Abdurazzoqov Islombek on 22/05/23.
//
//

import Foundation
import CoreData


extension NoteItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteItem> {
        return NSFetchRequest<NoteItem>(entityName: "NoteItem")
    }

    @NSManaged public var createData: String?
    @NSManaged public var nameNote: String?
    @NSManaged public var textNote: String?

}
