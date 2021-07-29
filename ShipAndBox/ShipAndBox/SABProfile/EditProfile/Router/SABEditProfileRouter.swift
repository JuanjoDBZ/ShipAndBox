//
//  SABEditProfileRouter.swift
//  ShipAndBox
//
//  Created by ISITA on 28/07/21.
//  
//

import Foundation
import UIKit

class SABEditProfileRouter {
    public var view: SABEditProfileVC
    private var presenter: SABEditProfilePresenter
    private var interactor: SABEditProfileInteractor
    init(data:DataUserProfile) {
        self.view = SABEditProfileVC()
        self.presenter = SABEditProfilePresenter()
        self.interactor = SABEditProfileInteractor()
        view.presenter = self.presenter
        view.GetDataUserProfile = data
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABEditProfileRouter: SABEditProfileRouterProtocol {
    /* Para mostrar una nueva pantalla con navigation controller.
    func showNewView() {
        Crea una instancia del router de la vista que quieres mostrar
        let newView = NewViewRouter(in: window)
        newView.showView()
    }*/
}

