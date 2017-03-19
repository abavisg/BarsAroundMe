//
//  PlaceListCell.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import UIKit

class PlaceListCell: UITableViewCell, TableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!

    var viewModel:ListCellViewModel?
    
    func configure(with viewModel:ListCellViewModel){
        self.viewModel = viewModel
        
        nameLabel.text = self.viewModel?.nameString
        distanceLabel.text = self.viewModel?.distanceString
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.nameLabel.text = nil
        self.distanceLabel.text = nil
    }
}
