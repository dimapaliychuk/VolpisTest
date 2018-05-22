//
//  MapViewController.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/22/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {

    @IBOutlet private weak var mapView: MKMapView!
    @IBOutlet private weak var objListButton: UIButton!
    var places = [Place]()
    
    
    // MARK: dependencies
    
    var presenter: MapViewToPresenterProtocol!
    
    
    // MARK: life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MapAssembly.sharedInstance.configure(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    
    // MARK: private
    
    private func setupUI() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu"), style: .plain, target: self, action: nil)
        navigationItem.title = "map".localized.uppercased()
        
        for item in places {
            if let latitude = item.latitude, let longitude = item.longitude {
                let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                let annotation = MKPointAnnotation()
                annotation.coordinate = coordinate
                annotation.title = item.title
                
                mapView.addAnnotation(annotation)
            }
        }
        
        if  places.count > 0,
            let latitude = places[0].latitude,
            let longitude = places[0].longitude {
            let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
            let span = MKCoordinateSpanMake(0.02, 0.02)
            let region = MKCoordinateRegion(center: coordinate, span: span)
            
            mapView.setRegion(region, animated: true)
        }
    }
    
    
    // MARK: action
    
    @IBAction func objListButtonAction(_ sender: Any) {
        presenter.presentMainViewContriller()
    }

}
