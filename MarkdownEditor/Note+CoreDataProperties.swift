//
//  Note+CoreDataProperties.swift
//  MarkdownEditor
//
//  Created by Hyunkyu Lee on 1/5/17.
//  Copyright © 2017 Hyunkyu Lee. All rights reserved.
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note");
    }

    @NSManaged public var text: String?
    @NSManaged public var lastModified: NSDate?
    @NSManaged public var tags: String?
    @NSManaged public var path: String?
    @NSManaged public var id: String?

}
