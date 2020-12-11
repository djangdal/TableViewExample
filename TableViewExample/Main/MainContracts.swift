//
//  MainContracts.swift
//  voi-app
//
//  Created by David Jangdal on 2020-11-18.
//  Copyright © 2019 Voi Technology. All rights reserved.
//

import Voiper

protocol MainViewControllerProtocol: ViewControllerProtocol {
    func reloadUI()
}

protocol MainPresenterProtocol: PresenterProtocol {
    var numberOfRows: Int { get }
    func dataSource(for row: Int) -> CellDataSource
}

protocol MainInteractorProtocol: InteractorProtocol {
}

protocol MainRouterProtocol: RouterProtocol {
}

final class MainOrganiser: Organiser {
    typealias ViewController = MainViewController
    typealias Interactor = MainInteractor
    typealias Presenter = MainPresenter
    typealias Router = MainRouter
}
