//
//  MainRouter.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import UIKit


class MainRouter: MainPresenterToRouterProtocol {
    
    weak var mainViewController: MainViewController!
    
    func presentMapViewContriller(with places: [Place]) {
        let mapVC = UIStoryboard(
            name: "Map",
            bundle: nil
        ).instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        mapVC.places = places
        
        mainViewController.navigationController?.pushViewController(mapVC, animated: true)
    }
    
}
