//
//  MapRouter.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/22/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import Foundation


import UIKit

class MapRouter: MapPresenterToRouterProtocol {
    
    weak var mapViewController: MapViewController!
    
    func presentMainViewContriller() {
        mapViewController.navigationController?.popViewController(animated: true)
    }
    
}
