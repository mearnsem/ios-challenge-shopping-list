//
//  Item.swift
//  ShoppingList
//
//  Created by Emily Mearns on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class Item: NSManagedObject {

    convenience init(name: String, isComplete: Bool, context: NSManagedObjectContext) {
        guard let context = NSManagedObjectContext(managedObjectContext(entity: "Item")) else { return }
        
        let moc = Stack.sharedStack.managedObjectContext
        let entity = 
        
        self.name = name
        self.isComplete = isComplete
    }
}
