//
//  ItemController.swift
//  ShoppingList
//
//  Created by Emily Mearns on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ItemController {
    
    static let sharedController = ItemController()
    var items: [Item] = []
    
    init() {
        self.items = fetchItems()
//        self.items = mockItems()
     }
    
    func mockItems() -> [Item] {
        if let item1 = Item(name: "bananas", isComplete: true),
            let item2 = Item(name: "milk", isComplete: false) {
            return [item1, item2]
        } else {
            return []
        }
    }
    
    func addItem(name: String, isComplete: Bool) {
        _ = Item(name: name, isComplete: isComplete)
        saveToPersistentStore()
    }
    
    func updateItem(item: Item, name: String, isComplete: Bool) {
        item.name = name
        item.isComplete = isComplete
        saveToPersistentStore()
    }
    
    func deleteItem(item: Item) {
        if let moc = item.managedObjectContext {
            moc.deleteObject(item)
            saveToPersistentStore()
        }
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving items.")
        }
    }
    
    func fetchItems() -> [Item] {
        let request = NSFetchRequest(entityName: "Item")
        let moc = Stack.sharedStack.managedObjectContext
        return (try? moc.executeFetchRequest(request)) as? [Item] ?? []
    }
    
    func buttonToggleValueChanged(item: Item) {
        item.isComplete = !item.isComplete.boolValue
        saveToPersistentStore()
    }
    
}