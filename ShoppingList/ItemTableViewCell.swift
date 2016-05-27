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

    @IBAction func buttonTapped(sender: AnyObject) {
    }
    
    func updateWithItem(item: Item) {
        itemNameLabel.text = item.name
        updateButton(item.isComplete.boolValue)
        
    }
    
    func updateButton(isComplete: Bool) {
        if isComplete {
            button.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            button.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }
    
    

}
