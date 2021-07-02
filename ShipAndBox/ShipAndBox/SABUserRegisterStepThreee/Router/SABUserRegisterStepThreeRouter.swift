//
//  SABUserRegisterStepThreeRouter.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//  
//

import Foundation
import UIKit

class SABUserRegisterStepThreeRouter {
    public var view: SABUserRegisterStepThreeVC
    private var presenter: SABUserRegisterStepThreePresenter
    private var interactor: SABUserRegisterStepThreeInteractor
    init() {
        self.view = SABUserRegisterStepThreeVC()
        self.presenter = SABUserRegisterStepThreePresenter()
        self.interactor = SABUserRegisterStepThreeInteractor()
        let remoteDataManager: SABUserRegisterStepThreeRemoteDataManagerInputProtocol = SABUserRegisterStepThreeRemoteDataManager()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
        interactor.remoteDatamanager = remoteDataManager
        remoteDataManager.remoteRequestHandler = interactor
    }
}
extension SABUserRegisterStepThreeRouter: SABUserRegisterStepThreeRouterProtocol {
    /* Para mostrar una nueva pantalla con navigation controller.
    func showNewView() {
        Crea una instancia del router de la vista que quieres mostrar
        let newView = NewViewRouter(in: window)
        newView.showView()
    }*/
}

