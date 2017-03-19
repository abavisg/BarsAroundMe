//
//  TableViewCell.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import UIKit

protocol TableViewCell {
    func configure(with viewModel:CellViewModel)
}

protocol Reusable {
    static var identifier: String { get }
}

extension Reusable {
    static var identifier: String {
        return String(describing: self)
    }
}

protocol ConfigurableCell {
    associatedtype Item
    func configure(with item: Item)
}




