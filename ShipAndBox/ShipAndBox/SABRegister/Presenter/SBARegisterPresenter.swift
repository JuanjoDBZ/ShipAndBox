//
//  SBARegisterPresenter.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//

import Foundation

class SBARegisterPresenter {
    
    var view: SBARegisterViewProtocol?
    var interactor: SBARegisterInteractorInputProtocol?
    var router: SBARegisterRouterProtocol?
    
}
extension SBARegisterPresenter: SBARegisterPresenterProtocol {
    //Uso y nombre opcional
    func getInitialInfo() {
        interactor?.processInfo()
    }
}
extension SBARegisterPresenter: SBARegisterInteractorOutputProtocol {
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
