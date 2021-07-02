//
//  SABChangePasswordRouter.swift
//  ShipAndBox
//
//  Created by ISITA on 30/06/21.
//  
//

import Foundation
import UIKit

class SABChangePasswordRouter {
    public var view: SABChangePasswordVC
    private var presenter: SABChangePasswordPresenter
    private var interactor: SABChangePasswordInteractor
    init() {
        self.view = SABChangePasswordVC()
        self.presenter = SABChangePasswordPresenter()
        self.interactor = SABChangePasswordInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABChangePasswordRouter: SABChangePasswordRouterProtocol {
    /* Para mostrar una nueva pantalla con navigation controller.
    func showNewView() {
        Crea una instancia del router de la vista que quieres mostrar
        let newView = NewViewRouter(in: window)
        newView.showView()
    }*/
}

