//
//  SABProfileInteractor.swift
//  ShipAndBox
//
//  Created by ISITA on 21/07/21.
//  
//

import Foundation

class SABProfileInteractor {
    var presenter: SABProfileInteractorOutputProtocol?
    
}
extension SABProfileInteractor: SABProfileInteractorInputProtocol {
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
