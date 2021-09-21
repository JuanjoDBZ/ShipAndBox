//
//  SABCreateAccountRouter.swift
//  ShipAndBox
//
//  Created by ISITA on 31/08/21.
//  
//

import Foundation
import UIKit

class SABCreateAccountRouter {
    private var view: SABCreateAccountVC
    private var presenter: SABCreateAccountPresenter
    private var interactor: SABCreateAccountInteractor
    private var window: UIWindow?
    init(in window: UIWindow?) {
        self.view = SABCreateAccountVC()
        self.presenter = SABCreateAccountPresenter()
        self.interactor = SABCreateAccountInteractor()
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
extension SABCreateAccountRouter: SABCreateAccountRouterProtocol {
    /* Para mostrar una nueva pantalla con navigation controller.
    func showNewView() {
        Crea una instancia del router de la vista que quieres mostrar
        let newView = NewViewRouter(in: window)
        newView.showView()
    }*/
}

