//
//  ListViewViewModel.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import RxSwift
import RxCocoa
import CoreLocation

final class ListViewViewModel: ViewViewModel{
    
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
        if let latitude = place?.latitude, let longitude = place?.longitude {
            let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            self.openGoogleMaps(with: coordinates)
        }else{
            print("No coordinates for this place.")
        }
    }
    
    //MARK: - GoogleMaps
    
    func openGoogleMaps(with coordinates:CLLocationCoordinate2D){
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            let url = "comgooglemaps://?q=\(coordinates.latitude),\(coordinates.longitude)&zoom=14&views=traffic"
            UIApplication.shared.openURL(URL(string:url)!)
        } else {
            print("Can't open google maps!");
        }
    }
}
