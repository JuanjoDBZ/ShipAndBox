//
//  SABProfilePresenter.swift
//  ShipAndBox
//
//  Created by ISITA on 21/07/21.
//  
//

import Foundation

class SABProfilePresenter {
    
    var view: SABProfileViewProtocol?
    var interactor: SABProfileInteractorInputProtocol?
    var router: SABProfileRouterProtocol?
    
}
extension SABProfilePresenter: SABProfilePresenterProtocol {
    /// Ir a la pantalla de editar datos de usuario
    /// - Parameter data: Datos del usuario
    func editUserProfile(data: DataUserProfile) {
        router?.editUserProfileRouter(data: data)
    }
    /// Función para solicitar la información del usuario
    func getInfoUserProfile() {
        interactor?.getInfoUserProfileIntercator()
    }
}
extension SABProfilePresenter: SABProfileInteractorOutputProtocol {
    /// Pasar a la vista datos del usuario
    /// - Parameter data: Datos del usuario
    func setDataSucces(data: DataUserProfile) {
        view?.setDataSuccesInView(data: data)
    }
}
