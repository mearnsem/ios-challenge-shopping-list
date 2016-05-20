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
    
    func addItem(item: Item) {
        
    }
    
    func updateItem(item: Item, name: String) {
        
    }
    
    func deleteItem(item: Item) {
        
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
        
    }
}