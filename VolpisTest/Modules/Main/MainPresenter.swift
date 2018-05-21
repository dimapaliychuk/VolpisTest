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
    
    
}

extension MainPresenter: MainInterectorToPresenterProtocol {
   
}
