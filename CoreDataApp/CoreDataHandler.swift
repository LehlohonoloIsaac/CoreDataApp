//
//  CoreDataHandler.swift
//  CoreDataApp
//
//  Created by dvt on 2018/01/09.
//  Copyright © 2018 dvt. All rights reserved.
//

import UIKit
import CoreData

class CoreDataHandler: NSObject {

    private class func getContext() -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        return (appDelegate?.persistentContainer.viewContext)!
    }
    
    class func saveObject(username: String, password: String) -> User {
        let context = getContext()
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let managedObject = NSManagedObject(entity: entity!, insertInto: context)
        
        managedObject.setValue(username, forKey: "username")
        managedObject.setValue(password, forKey: "password")
        
        do {
            try context.save()
            return managedObject as! User
        } catch {
            return managedObject as! User
        }
    }
    
    
    class func fetchObject() -> [User]? {
        let context = getContext()
        var users: [User]? = nil
        
        do {
            users = try context.fetch(User.fetchRequest())
            return users
        } catch {
            return users
        }
    }
    
    class func deleteObject(user: User) -> Bool {
        let context = getContext()
        context.delete(user)
        do {
            try context.save()
            return true
        } catch {
            return false
        }
    }
    
    class func cleanDelete() -> Bool {
        let context = getContext()
        let delete = NSBatchDeleteRequest(fetchRequest: User.fetchRequest())
        
        do {
            try context.execute(delete)
            return true
        } catch {
            return false
        }
    }
}
