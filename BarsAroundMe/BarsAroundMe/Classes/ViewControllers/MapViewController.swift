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
    
    @IBOutlet weak var refreshButton: UIButton!
    @IBOutlet weak var mapView: MKMapView!

    fileprivate let disposeBag = DisposeBag()
    
    var viewModel:MapViewViewModel?
    
    var calloutView:CalloutView?
    var calloutViewViewModel:CalloutViewViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Bars Around Me"
        self.tabBarItem.title = ""

        initViewModel()
        initReactive()
        initMapView()
        
        viewModel?.requestCurrentLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - IBActions
    
    @IBAction func tappedRefresh(_ sender: Any) {
        self.viewModel?.requestCurrentLocation()
    }
    
    //MARK: - ListViewViewModel
    private func initViewModel(){
        viewModel = MapViewViewModel(withDataProvider: PlaceAroundLocationDataProvider())
    }
    
    //MARK: - Reactive
    private func initReactive(){
        self.viewModel?.data.asObservable().subscribe(onNext: { collections in
            DispatchQueue.main.async {
                self.reloadMapView()
            }
        }).addDisposableTo(disposeBag)
    }
    
    //MARK: - MapView
    private func initMapView(){
        mapView.showsUserLocation = true
        mapView.delegate = self
    }
    
    private func reloadMapView(){
        resetMapView()
        if let places = self.viewModel?.places{
            var annotations = [MKPointAnnotation]()
            for i in 0..<places.count{
                let place = places[i]
                let annotation = PointAnnotation()
                annotation.coordinate = CLLocationCoordinate2D(latitude: place.latitude!, longitude: place.longitude!)
                annotation.place = place
                annotations.append(annotation)
            }
            self.mapView.showAnnotations(annotations, animated: true)
        }
    }
    
    private func resetMapView(){
        let annotations = mapView.annotations.filter {
            $0 !== self.mapView.userLocation
        }
        mapView.removeAnnotations(annotations)
    }
}

extension MapViewController:  MKMapViewDelegate{
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard !(view.annotation is MKUserLocation) else{
            return
        }
        guard let annotation = view.annotation as? PointAnnotation, let place = annotation.place else {
            return
        }
        if calloutViewViewModel == nil {
            calloutViewViewModel = CalloutViewViewModel()
        }
        calloutViewViewModel?.update(with: place, and: (viewModel?.currentLocation)!)
        
        if calloutView == nil {
            let views = Bundle.main.loadNibNamed("CalloutView", owner: nil, options: nil)
            calloutView = views?[0] as? CalloutView
        }else{
            calloutView?.removeFromSuperview()
            
        }
        calloutView?.center = CGPoint(x: view.bounds.size.width / 2, y: -((calloutView?.bounds.size.height)!*0.52))
        calloutView?.update(with: calloutViewViewModel!)
        view.addSubview(calloutView!)
        mapView.setCenter((view.annotation?.coordinate)!, animated: true)
    }
}
