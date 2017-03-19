//
//  TableViewCell.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import UIKit

protocol TableViewCell {
    associatedtype ViewModel
    func configure(with viewModel:ViewModel)
}

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}



