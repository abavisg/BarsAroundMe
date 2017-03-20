//
//  MapViewController.swift
//  BarsAroundMe
//
//  Created by Giorgos Ampavis on 19/03/2017.
//  Copyright © 2017 Giorgos Ampavis. All rights reserved.
//

import UIKit
import MapKit
import RxSwift
import RxCocoa
import CoreLocation

class MapViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    fileprivate let disposeBag = DisposeBag()
    
    var viewModel:MapViewViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        viewModel = MapViewViewModel(withDataProvider: PlaceAroundLocationDataProvider())
        viewModel?.refresh(withCoordinates: CLLocationCoordinate2D(latitude: -33.8698537, longitude: 151.1977208))
        
        self.viewModel?.data.asObservable().subscribe(onNext: { collections in
            self.reloadMapView()
            
        }).addDisposableTo(disposeBag)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - MapView
    
    private func reloadMapView(){
        if let places = self.viewModel?.places{
            var annotations = [MKPointAnnotation]()
            for i in 0..<places.count{
                let place = places[i]
                let annotation = PointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!)
                annotation.placeName = place.name
                annotation.distanceFromUser = "1 km"
                annotations.append(annotation)
            }
            self.mapView.showAnnotations(annotations, animated: true)
        }
    }
}

extension MapViewController:  MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard !(view.annotation is MKUserLocation) else{
            return
        }
        let annotation = view.annotation as! PointAnnotation
        let views = Bundle.main.loadNibNamed("CalloutView", owner: nil, options: nil)
        let calloutView = views?[0] as! CalloutView

        calloutView.center = CGPoint(x: view.bounds.size.width / 2, y: -calloutView.bounds.size.height*0.52)
        view.addSubview(calloutView)
        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    }
}
