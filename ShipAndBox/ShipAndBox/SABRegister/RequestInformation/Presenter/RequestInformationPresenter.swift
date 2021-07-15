//
//  RequestInformationPresenter.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 06/07/21.
//  
//

import Foundation

class RequestInformationPresenter {
    
    var view: RequestInformationViewProtocol?
    var interactor: RequestInformationInteractorInputProtocol?
    var router: RequestInformationRouterProtocol?
    
}
extension RequestInformationPresenter: RequestInformationPresenterProtocol {
    func goToStepThreeRegister(customerId: Int) {
        router?.showViewStepThreeRegister(customerId: customerId)
    }
    
    /// Funcion crear usuario
    /// - Parameter data: datos para crear usuario
    func createNewUserView(data: DataUserRegister) {
        interactor?.createNewUserPresenter(data: data)
    }
    //Uso y nombre opcional
    func getInitialInfo() {
        interactor?.processInfo()
    }
}
extension RequestInformationPresenter: RequestInformationInteractorOutputProtocol {
    func sendSuccesResponseToInteractor(customerId:Int) {
        view?.sendSuccesResponseToView(customerId:customerId)
    }
    
    func sendErrorResponseToInteractor(msgError: String) {
        view?.sendErrorResponseToView(msgError: msgError)
    }
    
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
