//
//  SABRecoverPasswordPresenter.swift
//  ShipAndBox
//
//  Created by ISITA on 30/08/21.
//  
//

import Foundation

class SABRecoverPasswordPresenter {
    
    var view: SABRecoverPasswordViewProtocol?
    var interactor: SABRecoverPasswordInteractorInputProtocol?
    var router: SABRecoverPasswordRouterProtocol?
    
}
extension SABRecoverPasswordPresenter: SABRecoverPasswordPresenterProtocol {
    //Uso y nombre opcional
    func getInitialInfo() {
        interactor?.processInfo()
    }
}
extension SABRecoverPasswordPresenter: SABRecoverPasswordInteractorOutputProtocol {
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
