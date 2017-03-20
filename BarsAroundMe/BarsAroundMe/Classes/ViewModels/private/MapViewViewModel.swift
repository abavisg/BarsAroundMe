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

final class MapViewViewModel: ViewControllerViewModel{
    
    fileprivate let disposeBag = DisposeBag()
    
    var data: Variable<[Place]> = Variable<[Place]>([])
    
    var places: [Place]{
        return data.value
    }
    
    let dataProvider:DataProvider
    
    var locationService:GetCurrentLocationService?
    var currentLocation:CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    init(withDataProvider dataProvider:DataProvider){
        self.dataProvider = dataProvider
        
        locationService = GetCurrentLocationService(with: CLLocationManager())
        locationService?.completionHandler = {(coordinates, error) in
            guard error == nil else{
                return
            }
            if let coordinates = coordinates{
                self.currentLocation = coordinates
                self.refresh(withCoordinates: coordinates)
            }else{
                //alert user for no location
            }
        }
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
    
    //MARK: - Location
    
    func requestCurrentLocation(){
        locationService?.requestCurrentLocation()
    }
    
}
