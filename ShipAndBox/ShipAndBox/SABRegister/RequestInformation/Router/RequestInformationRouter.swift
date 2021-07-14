//
//  RequestInformationRouter.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 06/07/21.
//  
//

import Foundation
import UIKit

class RequestInformationRouter {
    var view: RequestInformationVC
    private var presenter: RequestInformationPresenter
    private var interactor: RequestInformationInteractor
    init(data:DataUserRegister) {
        self.view = RequestInformationVC()
        self.presenter = RequestInformationPresenter()
        self.interactor = RequestInformationInteractor()
        view.presenter = self.presenter
        view.dataUserRegister = data
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension RequestInformationRouter: RequestInformationRouterProtocol {
    /* Para mostrar una nueva pantalla con navigation controller.
    func showNewView() {
        Crea una instancia del router de la vista que quieres mostrar
        let newView = NewViewRouter(in: window)
        newView.showView()
    }*/
}

