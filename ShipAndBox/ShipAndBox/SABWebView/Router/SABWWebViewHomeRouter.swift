//
//  SABWWebViewHomeRouter.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//

import Foundation
import UIKit

class SABWWebViewHomeRouter {
    public var view: SABWWebViewHomeVC
    private var presenter: SABWWebViewHomePresenter
    private var interactor: SABWWebViewHomeInteractor
    private var window: UIWindow?
    init() {
        self.view = SABWWebViewHomeVC()
        self.presenter = SABWWebViewHomePresenter()
        self.interactor = SABWWebViewHomeInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABWWebViewHomeRouter: SABWWebViewHomeRouterProtocol {
    /* Para mostrar una nueva pantalla con navigation controller.
    func showNewView() {
        Crea una instancia del router de la vista que quieres mostrar
        let newView = NewViewRouter(in: window)
        newView.showView()
    }*/
}

