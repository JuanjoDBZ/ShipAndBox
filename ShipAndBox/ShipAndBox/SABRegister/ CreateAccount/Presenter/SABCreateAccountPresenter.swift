//
//  SABCreateAccountPresenter.swift
//  ShipAndBox
//
//  Created by ISITA on 31/08/21.
//  
//

import Foundation

class SABCreateAccountPresenter {
    
    var view: SABCreateAccountViewProtocol?
    var interactor: SABCreateAccountInteractorInputProtocol?
    var router: SABCreateAccountRouterProtocol?
    
}
extension SABCreateAccountPresenter: SABCreateAccountPresenterProtocol {
    //Uso y nombre opcional
    func getInitialInfo() {
        interactor?.processInfo()
    }
}
extension SABCreateAccountPresenter: SABCreateAccountInteractorOutputProtocol {
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
