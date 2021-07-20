//
//  SABRegisterPresenter.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//
import Foundation
class SABRegisterPresenter {
    var view: SABRegisterViewProtocol?
    var interactor: SABRegisterInteractorInputProtocol?
    var router: SABRegisterRouterProtocol?
    var documentsValidate: [String:String] = [:]
}
extension SABRegisterPresenter: SABRegisterPresenterProtocol {
    ///Función para crear nuevo usuario
    /// - Parameter data: Datos del nuevo usuario
    func goToStepTwoRegisterNewUser(data: DataUserRegister) {
        router?.goToStepTwoUserRegisterR(data: data)
    }
    
    //Uso y nombre opcional
    func getInitialInfo() {
        interactor?.processInfo()
    }
    func validateDocuments(documents: [String: String]) {
        documentsValidate = documents
        interactor?.validateDocuments(documents: documents)
    }
    func showRequestInformation() {
        //router?.showRequestInformation(documents: documentsValidate)
    }
}
extension SABRegisterPresenter: SABRegisterInteractorOutputProtocol {
    /// Función para mostar error
    /// - Parameter error: Mensaje de error
    func errorResponseRegisterNewUser(error: String) {
        view?.errorResponseRegisterNewUser(error: error)
    }
    /// Función para mostar error
    /// - Parameter data: Datos para mostar en la vista
    func succesResponseRegisterNewUser(data: DataUserRegister) {
        view?.succesResponseRegisterNewUser(data: data)
    }
    
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
