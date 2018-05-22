//
//  MainProtocols.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import Foundation
import UIKit


protocol MainViewToPresenterProtocol: class {
    func showOnMap(with places: [Place])
}

protocol MainPresentorToInterectorProtocol: class {
    func showOnMap(with places: [Place])
}

protocol MainInterectorToPresenterProtocol: class {
    func showPlaces(places: [Place])
}

protocol MainPresenterToViewProtocol: class {
    func showPlaces(places: [Place])
}

protocol MainPresenterToRouterProtocol: class {
    func presentMapViewContriller() 
}

