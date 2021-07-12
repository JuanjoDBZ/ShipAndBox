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
    //Uso y nombre opcional
    func receiveData() {
        view?.loadInfo()
    }
}
