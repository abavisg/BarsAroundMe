//
//  ListViewModel.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import RxSwift
import RxCocoa
import CoreLocation

final class ListViewModel: ViewViewModel{
    
    fileprivate let disposeBag = DisposeBag()
    
    var data: Variable<[Place]> = Variable<[Place]>([])
    
    var places: [Place]{
        return data.value
    }
    
    let dataProvider:DataProvider
    
    init(withDataProvider dataProvider:DataProvider){
        self.dataProvider = dataProvider
    }
    
    func refresh(withCoordinates coordinates:CLLocationCoordinate2D){
        weak var weakSelf = self
        
        let locationString = "\(coordinates.latitude),\(coordinates.longitude)"
        let url = URL(string:locationString)!

        dataProvider.fetchResults(forURL: url) { (results, error) in
            if let results = results {
                weakSelf?.data.value = results as! [Place]
            }
        }
    }
    
    func itemAtIndexPath(indexPath:IndexPath)->Any{
        return places[indexPath.row]
    }
}