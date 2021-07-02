//
//  SABUserRegisterStepThreePresenter.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//  
//

import Foundation

class SABUserRegisterStepThreePresenter {
    
    var view: SABUserRegisterStepThreeViewProtocol?
    var interactor: SABUserRegisterStepThreeInteractorInputProtocol?
    var router: SABUserRegisterStepThreeRouterProtocol?
    
}
extension SABUserRegisterStepThreePresenter: SABUserRegisterStepThreePresenterProtocol {
    //Uso y nombre opcional
    func getInitialInfo() {
        interactor?.processInfo()
    }
}
extension SABUserRegisterStepThreePresenter: SABUserRegisterStepThreeInteractorOutputProtocol {
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
