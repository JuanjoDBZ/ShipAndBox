//
//  SBARegisterRouter.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//

import Foundation
import UIKit

class SBARegisterRouter {
    var view: SBARegisterVC
    private var presenter: SBARegisterPresenter
    private var interactor: SBARegisterInteractor
    init() {
        self.view = SBARegisterVC()
        self.presenter = SBARegisterPresenter()
        self.interactor = SBARegisterInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SBARegisterRouter: SBARegisterRouterProtocol {
    /* Para mostrar una nueva pantalla con navigation controller.
    func showNewView() {
        Crea una instancia del router de la vista que quieres mostrar
        let newView = NewViewRouter(in: window)
        newView.showView()
    }*/
}

