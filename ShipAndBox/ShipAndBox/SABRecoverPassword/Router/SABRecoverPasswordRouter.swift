//
//  SABRecoverPasswordRouter.swift
//  ShipAndBox
//
//  Created by ISITA on 30/08/21.
//  
//

import Foundation
import UIKit

class SABRecoverPasswordRouter {
    public var view: SABRecoverPasswordVC
    private var presenter: SABRecoverPasswordPresenter
    private var interactor: SABRecoverPasswordInteractor
    private var window: UIWindow?
    init() {
        self.view = SABRecoverPasswordVC()
        self.presenter = SABRecoverPasswordPresenter()
        self.interactor = SABRecoverPasswordInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABRecoverPasswordRouter: SABRecoverPasswordRouterProtocol {
    /* Para mostrar una nueva pantalla con navigation controller.
    func showNewView() {
        Crea una instancia del router de la vista que quieres mostrar
        let newView = NewViewRouter(in: window)
        newView.showView()
    }*/
}

