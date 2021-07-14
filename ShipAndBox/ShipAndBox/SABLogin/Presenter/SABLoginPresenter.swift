//
//  SABLoginPresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 30/06/21.
//  
//
import Foundation
class SABLoginPresenter {
    var view: SABLoginViewProtocol?
    var interactor: SABLoginInteractorInputProtocol?
    var router: SABLoginRouterProtocol?
}
extension SABLoginPresenter: SABLoginPresenterProtocol {
    /// Ir a la pantalla de registro de usuario
    func registerNewUser() {
        router?.registerNewUserRouter()
    }
    
    /// Funcion que permite la interacción entre el presenter y el interactor.
    /// - Parameters:
    ///   - usrEmail: Correo usuario.
    ///   - usrPassword: Contraseña usuario.
    func loginUser(usrEmail: String, usrPassword: String) {
        interactor?.loginUserInteractor(usrEmail: usrEmail, usrPassword: usrPassword)
    }
}
extension SABLoginPresenter: SABLoginInteractorOutputProtocol {
}
