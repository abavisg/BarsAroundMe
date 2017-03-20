//
//  View.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import UIKit

protocol View{
    associatedtype ViewModel
    func update(with viewModel:ViewModel)
}
