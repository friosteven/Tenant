//
//  CartCoreDataManager.swift
//  Tenant
//
//  Created by Steven Frio on 12/3/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    func saveData() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }
    

    private init() {
        persistentContainer = NSPersistentContainer(name: "CartEntity")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize core data stack \(error)")
            }

        }
    }
}

struct CartCDModel {
    
}
