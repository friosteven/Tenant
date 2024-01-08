//
//  CartEntity+CoreDataProperties.swift
//  Tenant
//
//  Created by Steven Frio on 1/8/24.
//
//

import Foundation
import CoreData


extension CartEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CartEntity> {
        return NSFetchRequest<CartEntity>(entityName: "CartEntity")
    }

    @NSManaged public var imageURL: String?
    @NSManaged public var productCode: String?
    @NSManaged public var productName: String?
    @NSManaged public var quantity: Int16
    @NSManaged public var tenantID: Int16
    @NSManaged public var unitPrice: Float
    @NSManaged public var id: Int16

}
