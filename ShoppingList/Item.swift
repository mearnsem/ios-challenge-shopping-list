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

    convenience init(name: String, isComplete: Bool, context: NSManagedObjectContext = Stack.sharedStack.managedObjectContext) {
        let entity = NSEntityDescription.entityForName("Item", inManagedObjectContext: context)!
        
        self.init(entity: entity, insertIntoManagedObjectContext: context)
        
        self.name = name
        self.isComplete = isComplete
    }
}
