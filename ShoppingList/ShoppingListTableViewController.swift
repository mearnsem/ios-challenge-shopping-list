//
//  ShoppingListTableViewController.swift
//  ShoppingList
//
//  Created by Emily Mearns on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ShoppingListTableViewController: UITableViewController {


    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()

    }
    
    // MARK: - IBActions
    
    @IBAction func addButtonPressed(sender: AnyObject) {
        var itemTextField: UITextField?
        let alertController = UIAlertController(title: "Add Item", message: "Add an item to your shopping list", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (textField) in
            itemTextField = textField
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (_) in
            guard let item = itemTextField?.text else {return}
            ItemController.sharedController.addItem(item, isComplete: false)
        }
        alertController.addAction(cancelAction)
        alertController.addAction(addAction)
        self.navigationController?.presentViewController(alertController, animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ItemController.sharedController.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemCell", forIndexPath: indexPath)

        let item = ItemController.sharedController.items[indexPath.row]
        cell.textLabel?.text = item.name

        return cell
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let item = ItemController.sharedController.items[indexPath.row]
            ItemController.sharedController.deleteItem(item)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }

}
