//
//  CoreDataManager.swift
//  Tenant
//
//  Created by Steven Frio on 12/3/23.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {

    let persistentContainer: NSPersistentContainer
    static let shared = CoreDataManager()

    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }

    init() {
        persistentContainer = NSPersistentContainer(name: "TenantCoreDataModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Unable to initialize core data stack \(error)")
            }
        }
    }

    func saveData() {
        do {
            try viewContext.save()
        } catch {
            viewContext.rollback()
            print(error.localizedDescription)
        }
    }

    func readAllData() -> [CartEntity] {
        let request: NSFetchRequest<CartEntity> = CartEntity.fetchRequest()
        do {
            return try viewContext.fetch(request)
        } catch {
            return []
        }
    }

    func checkCount() -> Int {
        do {
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CartEntity")
            let count = try viewContext.count(for: request)
            return count
        } catch {
            return 0
        }
    }
}
