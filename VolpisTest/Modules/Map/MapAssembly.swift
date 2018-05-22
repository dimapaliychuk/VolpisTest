//
//  MapAssembly.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/22/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import UIKit

class MapAssembly: NSObject {
    
    static let sharedInstance = MapAssembly()
    
    func configure(_ viewController: MapViewController) {
        let presenter = MapPresenter()
        let router = MapRouter()
        router.mapViewController = viewController
        viewController.presenter = presenter
        presenter.router = router
    }
}
