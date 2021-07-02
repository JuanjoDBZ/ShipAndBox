//
//  SABChangePasswordInteractor.swift
//  ShipAndBox
//
//  Created by ISITA on 30/06/21.
//  
//

import Foundation

class SABChangePasswordInteractor {
    var presenter: SABChangePasswordInteractorOutputProtocol?
    
}
extension SABChangePasswordInteractor: SABChangePasswordInteractorInputProtocol {
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
