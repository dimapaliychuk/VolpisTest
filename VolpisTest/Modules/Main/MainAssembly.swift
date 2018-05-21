//
//  MainAssembly.swift
//  VolpisTest
//
//  Created by Dima Paliychuk on 5/21/18.
//  Copyright © 2018 Dima Paliychuk. All rights reserved.
//

import UIKit

class MainAssembly: NSObject {
    
    static let sharedInstance = MainAssembly()
    
    func configure(_ viewController: MainViewController) {
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let router = MainRouter()
        router.mainViewController = viewController
        interactor.presenter = presenter
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.view = viewController
        presenter.router = router
    }
}
