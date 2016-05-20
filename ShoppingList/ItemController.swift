//
//  ItemController.swift
//  ShoppingList
//
//  Created by Emily Mearns on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation
import CoreData

class ItemController {
    static let sharedController = ItemController()
    
    var items: [Item] = []
    
    init() {
        
    }
    
    func addItem(name: String, isComplete: Bool) {
        _ = Item(name: name, isComplete: false)
        saveToPersistentStore()
    }
    
    func updateItem(item: Item, name: String) {
        deleteItem(item)
        addItem(name, isComplete: false)
        saveToPersistentStore()
    }
    
    func deleteItem(item: Item) {
        let moc = Stack.sharedStack.managedObjectContext
        moc.deleteObject(item)
    }
    
    func saveToPersistentStore() {
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Your item could not be saved.")
        }
    }
    
    func fetchItem() {
        let request = NSFetchRequest(entityName: "Item")
        let moc = Stack.sharedStack.managedObjectContext
        do {
            try moc.executeFetchRequest(request) as? [Item]
        } catch {
            print("Error")
        }
    }
}