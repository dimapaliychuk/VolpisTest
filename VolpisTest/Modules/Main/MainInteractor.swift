//
//  MainInteractor.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import UIKit
import Moya
import CoreLocation

class MainInteractor: NSObject, MainPresentorToInterectorProtocol {
    
    var presenter: MainInterectorToPresenterProtocol?
    let provider = MoyaProvider<API>()
    private let locationManager = CLLocationManager()
    fileprivate var currentLocation: CLLocationCoordinate2D?
    
    override init() {
        super.init()
        
        setup()
    }
    
    func showOnMap(with places: [Place]) {
        
    }
    
    
    // MARK: private
    
    private func setup() {
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
    }
    
    private func getPlaces() {
        guard let currentLocation = currentLocation else {
            return
        }
        provider.request(.getPlaces) { [weak self] (result) in
            switch result {
            case .success(let response):
                let placeResponse = try! JSONDecoder().decode(PlaceResponse.self, from: response.data)
                if let places = placeResponse.places {
                    
                    let coordinate0 = CLLocation(
                        latitude: currentLocation.latitude,
                        longitude: currentLocation.longitude
                    )
                    for item in places {
                        if let latitude = item.latitude,
                            let longitude = item.longitude  {
                            
                            let coordinate1 = CLLocation(
                                latitude: latitude,
                                longitude: longitude
                            )
                            let distanceInMeters = coordinate0.distance(from: coordinate1)
                            item.distanse = distanceInMeters 
                        }
                    }
                    
                    self?.presenter?.showPlaces(places: places)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension MainInteractor: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let locValue: CLLocationCoordinate2D = manager.location?.coordinate else { return }
        print("locations = \(locValue.latitude) \(locValue.longitude)")

        if currentLocation == nil {
            currentLocation = manager.location?.coordinate
            getPlaces()
        }
    }
}


