//
//  MainRouter.swift
//  voi-app
//
//  Created by David Jangdal on 2020-11-18.
//  Copyright © 2019 Voi Technology. All rights reserved.
//

import Voiper

final class MainRouter: Router {
    typealias Configuration = Void
    
    required init(configuration: Configuration) {
    }
}

extension MainRouter: MainRouterProtocol {
}
