//
//  Persistence.swift
//  CoreDataDemo
//
//  Created by Neil Smyth on 7/28/22.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    
    let container: NSPersistentCloudKitContainer

    init() {
        container = NSPersistentCloudKitContainer(name: "Products")
        
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
