//
//  CoreDataStack.swift
//  GuessWho
//
//  Created by Luqmaan Khan on 8/28/19.
//  Copyright © 2019 Luqmaan Khan. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    func saveContext(context: NSManagedObjectContext) throws {
        var error: Error?
        context.performAndWait {
            do {
                try context.save()
            } catch  let saveError{
                NSLog("Error saving moc: \(saveError)")
                error = saveError
            }
        }
        if let error = error {
            throw error
        }
    }
    lazy var container: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "User")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Failed to load persistent store(s): \(error)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        return container
    }()
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
}
