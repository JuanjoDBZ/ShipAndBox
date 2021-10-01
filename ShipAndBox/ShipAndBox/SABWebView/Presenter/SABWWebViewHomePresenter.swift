//
//  SABWWebViewHomePresenter.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//

import Foundation

class SABWWebViewHomePresenter {
    
    var view: SABWWebViewHomeViewProtocol?
    var interactor: SABWWebViewHomeInteractorInputProtocol?
    var router: SABWWebViewHomeRouterProtocol?
    
}
extension SABWWebViewHomePresenter: SABWWebViewHomePresenterProtocol {
    //Uso y nombre opcional
    func getInitialInfo() {
        interactor?.processInfo()
    }
}
extension SABWWebViewHomePresenter: SABWWebViewHomeInteractorOutputProtocol {
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
