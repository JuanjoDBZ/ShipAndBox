//
//  SABRegistroRouter.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//

import Foundation
import UIKit

class SABRegistroRouter {
    public var view: SABRegistroVC
    private var presenter: SABRegistroPresenter
    private var interactor: SABRegistroInteractor
    init() {
        self.view = SABRegistroVC()
        self.presenter = SABRegistroPresenter()
        self.interactor = SABRegistroInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABRegistroRouter: SABRegistroRouterProtocol {
}

