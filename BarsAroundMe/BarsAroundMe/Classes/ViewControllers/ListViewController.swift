//
//  ListViewController.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import CoreLocation

class ListViewController: UIViewController {

    @IBOutlet weak var list: UITableView!

    fileprivate let disposeBag = DisposeBag()
    
    var viewModel:ListViewViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ListViewViewModel(withDataProvider: PlaceAroundLocationDataProvider())
        viewModel?.requestCurrentLocation()
        
        viewModel?.data.asObservable().bindTo(list.rx.items(cellIdentifier: PlaceListCell.identifier, cellType: PlaceListCell.self)) { row, place, cell in
            let cellViewModel = PlaceListCellViewModel(with: place, coordinates: (self.viewModel?.currentLocation)!)
            cell.configure(with: cellViewModel)
        }.addDisposableTo(disposeBag)

        list.rx.itemSelected.map { indexPath in
                return (indexPath, self.viewModel?.places[indexPath.row])
            }
            .subscribe(onNext: { indexPath, model in
                if let selectedRowIndexPath = self.list.indexPathForSelectedRow {
                    self.list.deselectRow(at: selectedRowIndexPath, animated: true)
                }
                self.viewModel?.tappedItem(at: indexPath)
            })
            .disposed(by: disposeBag)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
