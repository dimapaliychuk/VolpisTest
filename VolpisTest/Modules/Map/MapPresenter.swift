//
//  MapPresenter.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/22/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import Foundation

class MapPresenter: MapViewToPresenterProtocol {

    var router: MapPresenterToRouterProtocol?
    
    func presentMainViewContriller() {
        router?.presentMainViewContriller()
    }
}

