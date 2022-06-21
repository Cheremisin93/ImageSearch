//
//  Photos+CoreDataProperties.swift
//  
//
//  Created by Cheremisin Andrey on 21.06.2022.
//
//

import Foundation
import CoreData


extension Photos {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Photos> {
        return NSFetchRequest<Photos>(entityName: "Photos")
    }

    @NSManaged public var imageData: Data?

}
