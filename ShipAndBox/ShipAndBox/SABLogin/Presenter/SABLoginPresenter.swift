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
    func loginUser(userId: Int, usrPassword: String) {
        interactor?.loginUserInteractor(userId: userId, usrPassword: usrPassword)
    }
    /// Funcion para mostrar la vista Home
    func showHome() {
        router?.showHomeRouting()
    }
}
extension SABLoginPresenter: SABLoginInteractorOutputProtocol {
    /// Función que trae los datos del servicio login del presenter al vista
    /// - Parameter resultLogin: Datos del servicio
    func resulSetLogin(resultLogin: dataLoginResultSerive) {
        view?.resulSetLoginView(resultLogin: resultLogin)
    }
    
}
