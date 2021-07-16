//
//  SABHomeRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 14/07/21.
//  
//

import Foundation
import UIKit

class SABHomeRouter {
    public var view: SABHomeVC
    private var presenter: SABHomePresenter
    private var interactor: SABHomeInteractor
    init() {
        self.view = SABHomeVC()
        self.presenter = SABHomePresenter()
        self.interactor = SABHomeInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABHomeRouter: SABHomeRouterProtocol {
}

