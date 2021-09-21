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
    private var view: SABRecoverPasswordVC
    private var presenter: SABRecoverPasswordPresenter
    private var interactor: SABRecoverPasswordInteractor
    private var window: UIWindow?
    init(in window: UIWindow?) {
        self.view = SABRecoverPasswordVC()
        self.presenter = SABRecoverPasswordPresenter()
        self.interactor = SABRecoverPasswordInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
        self.window = window
    }
    func showView() {
        window?.rootViewController = UINavigationController(rootViewController: view)
        window?.makeKeyAndVisible()
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

