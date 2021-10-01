//
//  SABHomePresenter.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//

import Foundation

class SABHomePresenter {
    
    var view: SABHomeViewProtocol?
    var interactor: SABHomeInteractorInputProtocol?
    var router: SABHomeRouterProtocol?
    
}
extension SABHomePresenter: SABHomePresenterProtocol {
    /// Llamar router para abrir la nueva pantalla webview
    func openWebViewSab() {
        router?.showWebViewSab()
    }
    //Uso y nombre opcional
    func getInitialInfo() {
        interactor?.processInfo()
    }
}
extension SABHomePresenter: SABHomeInteractorOutputProtocol {
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
