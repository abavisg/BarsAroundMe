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
    
    func update(with viewModel:CalloutViewViewModel){
        self.viewModel = viewModel
        nameLabel.text = self.viewModel?.nameString
        distanceLabel.text = self.viewModel?.distanceString
    }
}
