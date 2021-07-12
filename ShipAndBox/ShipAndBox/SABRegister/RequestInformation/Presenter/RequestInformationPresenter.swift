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
    //Uso y nombre opcional
    func getInitialInfo() {
        interactor?.processInfo()
    }
}
extension RequestInformationPresenter: RequestInformationInteractorOutputProtocol {
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
