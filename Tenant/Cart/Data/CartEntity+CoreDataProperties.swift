//
//  CartEntity+CoreDataProperties.swift
//  Tenant
//
//  Created by Steven Frio on 1/7/24.
//
//

import Foundation
import CoreData


extension CartEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartEntity> {
        return NSFetchRequest<CartEntity>(entityName: "CartEntity")
    }

    @NSManaged public var productID: Int16
    @NSManaged public var imageURL: String?
    @NSManaged public var unitPrice: Float
    @NSManaged public var quantity: Int16
    @NSManaged public var storeID: Int16
    @NSManaged public var productName: String?

}

extension CartEntity : Identifiable {

}
