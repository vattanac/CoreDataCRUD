//
//  PersistanceManager.swift
//  CoreDataDemo
//
//  Created by Vattanac on 12/5/18.
//  Copyright © 2018 vattanac. All rights reserved.
//

import Foundation
import CoreData

final class PersistenceManager{
    private init() {}
    static let share = PersistenceManager()
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "CoreDataDemo")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support
    
    func save() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
                print("saved successfully")
            } catch {
                
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        
        let entityName = String(describing: objectType)
        let fetchRequest =  NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        
        do {
            let fetchObject = try context.fetch(fetchRequest) as? [T]
            
            return fetchObject ?? [T]()
        }catch{
            print("error")
            return [T]()
        }
    }
}
