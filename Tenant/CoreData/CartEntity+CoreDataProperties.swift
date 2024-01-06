//
//  CartEntity+CoreDataProperties.swift
//  Tenant
//
//  Created by Steven Frio on 1/6/24.
//
//

import Foundation
import CoreData


extension CartEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartEntity> {
        return NSFetchRequest<CartEntity>(entityName: "CartEntity")
    }

    @NSManaged public var category: String?
    @NSManaged public var id: Int16
    @NSManaged public var image: URL?
    @NSManaged public var price: Float
    @NSManaged public var quantity: Int16
    @NSManaged public var storeId: Int16

}

extension CartEntity : Identifiable {

}
