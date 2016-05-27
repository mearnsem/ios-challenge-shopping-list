//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Emily Mearns on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController, ItemTableViewCellDelegate {

    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    @IBAction func addButtonPressed(sender: AnyObject) {
        var itemTextField: UITextField?
        
        let alertController = UIAlertController(title: "Add Item", message: "Add an item to your shopping list.", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            textField.placeholder = "Item name"
            itemTextField = textField
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (action) in
            guard let name = itemTextField!.text else {return}
            ItemController.sharedController.addItem(name, isComplete: false)
            self.tableView.reloadData()
        }
        alertController.addAction(addAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func updateButtonToggleValueChanged(sender: ItemTableViewCell) {
        guard let item = sender.item else {return}
        ItemController.sharedController.buttonToggleValueChanged(item)
        tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemController.sharedController.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath) as? ItemTableViewCell else {return ItemTableViewCell()}

        let item = ItemController.sharedController.items[indexPath.row]
        cell.updateWithItem(item)
        cell.delegate = self

        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let item = ItemController.sharedController.items[indexPath.row]
            ItemController.sharedController.deleteItem(item)
            
//            tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
 

}
