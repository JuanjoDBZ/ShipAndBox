//
//  RequestInformationInteractor.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 06/07/21.
//  
//

import Foundation

class RequestInformationInteractor {
    var presenter: RequestInformationInteractorOutputProtocol?
    
}
extension RequestInformationInteractor: RequestInformationInteractorInputProtocol {
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
