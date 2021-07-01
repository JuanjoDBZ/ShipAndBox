//
//  SBARegisterInteractor.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//

import Foundation

class SBARegisterInteractor {
    var presenter: SBARegisterInteractorOutputProtocol?
    
}
extension SBARegisterInteractor: SBARegisterInteractorInputProtocol {
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
