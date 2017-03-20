//
//  CalloutView.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import UIKit

class CalloutView:UIView, View{
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    
    var viewModel:CalloutViewViewModel?
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 5
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.borderWidth = 0.5
        self.layer.masksToBounds = true
    }
    
    func update(with viewModel:CalloutViewViewModel){
        self.viewModel = viewModel
        nameLabel.text = self.viewModel?.nameString
        distanceLabel.text = self.viewModel?.distanceString
    }
}
