//
//  List+CoreDataProperties.swift
//  Food-Ordering-App
//
//  Created by Rustem Manafov on 29.07.22.
//
//

import Foundation
import CoreData


extension Basket {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Basket> {
        return NSFetchRequest<Basket>(entityName: "Basket")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String?
    @NSManaged public var info: String?
    @NSManaged public var count: String?
    @NSManaged public var price: String?

}

extension Basket : Identifiable {

}
