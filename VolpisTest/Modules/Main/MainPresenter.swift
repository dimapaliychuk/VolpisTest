//
//  MainPresenter.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import Foundation

class MainPresenter: MainViewToPresenterProtocol {

    var view: MainPresenterToViewProtocol?
    var interactor: MainPresentorToInterectorProtocol?
    var router: MainPresenterToRouterProtocol?
    
    func showOnMap(with places: [Place]) {
        router?.presentMapViewContriller(with: places)
    }
}

extension MainPresenter: MainInterectorToPresenterProtocol {
    
    func showPlaces(places: [Place]) {
        view?.showPlaces(places: places)
    }

}
