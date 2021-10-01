//
//  SABRecoverPasswordInteractor.swift
//  ShipAndBox
//
//  Created by ISITA on 30/08/21.
//  
//

import Foundation

class SABRecoverPasswordInteractor {
    var presenter: SABRecoverPasswordInteractorOutputProtocol?
    
}
extension SABRecoverPasswordInteractor: SABRecoverPasswordInteractorInputProtocol {
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
