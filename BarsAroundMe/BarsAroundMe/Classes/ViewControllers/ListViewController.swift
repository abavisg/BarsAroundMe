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
    
    fileprivate var refreshControl: UIRefreshControl?
    fileprivate let disposeBag = DisposeBag()
    var viewModel:ListViewViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bars Around Me"
        self.tabBarItem.title = ""
        
        initViewModel()
        initReactive()
        initPullToRefresh()
        
        viewModel?.requestCurrentLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - ListViewViewModel
    private func initViewModel(){
        viewModel = ListViewViewModel(withDataProvider: PlaceAroundLocationDataProvider())
    }
    
    //MARK: - Reactive
    private func initReactive(){
        viewModel?.data.asObservable().subscribe(onNext: { collections in
            DispatchQueue.main.async {
                if let refreshControl = self.refreshControl, refreshControl.isRefreshing {
                    refreshControl.endRefreshing()
                }
            }
        }).addDisposableTo(disposeBag)
        
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
    
    //Mark: - Pull to refresh
    private func initPullToRefresh(){
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(self, action: #selector(self.handleRefresh), for: UIControlEvents.valueChanged)
        list.addSubview(refreshControl!)
    }
    
    @objc private func handleRefresh(){
        self.viewModel?.requestCurrentLocation()
    }
   
    
}
