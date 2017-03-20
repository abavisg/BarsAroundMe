//
//  MapViewViewModel.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 20/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import RxSwift
import RxCocoa
import CoreLocation

final class MapViewViewModel: ViewViewModel{
    
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
        
        let queries = ["location" : "\(coordinates.latitude),\(coordinates.longitude)"]
        let urlFactory = PlacesAroundLocationURLFactory(withBasePath: "https://maps.googleapis.com/maps/api/place/search/json", andParameters: queries)
        
        dataProvider.fetchResults(forURL: urlFactory.url()) { (results, error) in
            if let results = results {
                weakSelf?.data.value = results as! [Place]
            }
        }
    }
    
    func itemAtIndexPath(indexPath:IndexPath)->Any{
        return places[indexPath.row]
    }
    
    //MARK: - Actions
    
    func tappedItem(at indexPath:IndexPath){
        let place = self.itemAtIndexPath(indexPath: indexPath) as? Place
        
    }
    
    
}
