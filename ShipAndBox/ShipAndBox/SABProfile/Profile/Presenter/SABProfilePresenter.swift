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
    //Uso y nombre opcional
    func getInitialInfo() {
        interactor?.processInfo()
    }
}
extension SABProfilePresenter: SABProfileInteractorOutputProtocol {
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
