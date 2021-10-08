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
    /// Llamar al interactor para que envie correo
    /// - Parameter email: email de recuperación
    func recoverPassword(email: String) {
        interactor?.recoverPwdInteractor(email: email)
    }
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
