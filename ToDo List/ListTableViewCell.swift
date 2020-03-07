//
//  ListTableViewCell.swift
//  ToDo List
//
//  Created by Brandon Boey on 3/7/20.
//  Copyright © 2020 Brandon Boey. All rights reserved.
//

import UIKit
protocol ListTableViewCellDelegate: class {
    func checkBoxToggle(sender: ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {

    weak var delegate: ListTableViewCellDelegate?
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBAction func checkToggled(_ sender: UIButton) {
        delegate?.checkBoxToggle(sender: self)
    }
}
