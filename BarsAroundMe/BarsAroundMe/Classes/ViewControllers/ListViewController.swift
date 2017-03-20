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
    
    var viewModel:ListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = ListViewModel(withDataProvider: PlaceAroundLocationDataProvider())
        viewModel?.refresh(withCoordinates: CLLocationCoordinate2D(latitude: -33.8698537, longitude: 151.1977208))
        
        viewModel?.data.asObservable().bindTo(list.rx.items(cellIdentifier: PlaceListCell.identifier, cellType: PlaceListCell.self)) { row, place, cell in
            let cellViewModel = ListCellViewModel(with: place, coordinates: CLLocationCoordinate2D(latitude: -33.8698537, longitude: 151.1977208))
            cell.configure(with: cellViewModel)
        }.addDisposableTo(disposeBag)

        list.rx.itemSelected.map { indexPath in
                return (indexPath, self.viewModel?.places[indexPath.row])
            }
            .subscribe(onNext: { indexPath, model in
                
                self.viewModel?.tappedItem(at: indexPath)
            })
            .disposed(by: disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
