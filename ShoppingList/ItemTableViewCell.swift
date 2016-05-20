//
//  ItemTableViewCell.swift
//  ShoppingList
//
//  Created by Emily Mearns on 5/20/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    // MARK: - IBOutlets & Properties
    
    @IBOutlet var itemTextLabel: UILabel!
    @IBOutlet var buttonTapped: UIButton!
    var item: Item?
    
    // MARK: - IBActions
    
    @IBAction func buttonTapped(sender: UIButton) {
        
    }
    
    // MARK: - Functions
    
    func updateWith() {
        if let item = item {
            self.itemTextLabel.text = item.name
            buttonTapped.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }

}

protocol ButtonValueChangedDelegate {
    func buttonValueChanged()
}

extension ButtonValueChangedDelegate {
    func buttonValueChanged() {
        
    }
}