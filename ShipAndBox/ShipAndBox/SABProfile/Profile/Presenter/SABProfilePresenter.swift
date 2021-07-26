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
    /// Función para solicitar la información del usuario
    func getInfoUserProfile() {
        interactor?.getInfoUserProfileIntercator()
    }
}
extension SABProfilePresenter: SABProfileInteractorOutputProtocol {
    func setDataSucces(data: DataUserProfile) {
        view?.setDataSuccesInView(data: data)
    }
    
    //Uso y nombre opcional
}
