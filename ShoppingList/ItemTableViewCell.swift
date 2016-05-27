//
//  ItemTableViewCell.swift
//  ShoppingList
//
//  Created by Emily Mearns on 5/27/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemNameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var delegate: ItemTableViewCellDelegate?

    @IBAction func buttonTapped(sender: AnyObject) {
        if let delegate = delegate {
            delegate.updateButtonToggleValueChanged(self)
        }
    }
    
    func updateWithItem(item: Item) {
        itemNameLabel.text = item.name
        updateButton(item.isComplete.boolValue)
        ItemController.sharedController.saveToPersistentStore()
    }
    
    func updateButton(isComplete: Bool) {
        if isComplete {
            button.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            button.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
}

protocol ItemTableViewCellDelegate {
    func updateButtonToggleValueChanged(sender: ItemTableViewCell)
}
