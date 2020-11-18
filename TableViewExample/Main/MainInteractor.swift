//
//  MainInteractor.swift
//  voi-app
//
//  Created by David Jangdal on 2020-11-18.
//  Copyright © 2019 Voi Technology. All rights reserved.
//

import Voiper
import Foundation

final class MainInteractor: Interactor {
    typealias Configuration = Void
    
    required init(configuration: Configuration) {
    }
}

extension MainInteractor: MainInteractorProtocol {
}
