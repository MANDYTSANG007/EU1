//
//  ListTableViewCell.swift
//  EU
//
//  Created by HING MAN TSANG on 9/14/22.
//

import UIKit

// 5.12 12:00 add protocol
protocol ListTableViewCellDelegate: class {
    func euroButtonToggled(sender: ListTableViewCell)
}

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var euroButton: UIButton!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    
    // 5.12 12:15 Declare delegate variable
    weak var delegate: ListTableViewCellDelegate?
    
    // 5.12 15:18
    // Declare property and add didSet (if nation changes, we are going to update these 3 user interfaces
    var nation: Nation! {
        didSet {
            countryLabel.text = nation.country
            capitalLabel.text = "Capital: \(nation.capital) "
            euroButton.isSelected = nation.usesEuro
        }
    }
    
    @IBAction func euroTapped(_ sender: UIButton) {
        delegate?.euroButtonToggled(sender: self) // put "self" here because it is the name of the class - ListTableViewCell
    }
}
