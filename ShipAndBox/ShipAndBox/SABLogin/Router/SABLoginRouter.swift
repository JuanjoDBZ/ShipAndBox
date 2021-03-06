//
//  SABLoginRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 30/06/21.
//  
//

import Foundation
import UIKit

class SABLoginRouter {
    public var view: SABLoginVC
    private var presenter: SABLoginPresenter
    private var interactor: SABLoginInteractor
    init() {
        self.view = SABLoginVC()
        self.presenter = SABLoginPresenter()
        self.interactor = SABLoginInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABLoginRouter: SABLoginRouterProtocol {
}

