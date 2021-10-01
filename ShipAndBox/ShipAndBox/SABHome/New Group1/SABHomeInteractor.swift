//
//  SABHomeInteractor.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//

import Foundation

class SABHomeInteractor {
    var presenter: SABHomeInteractorOutputProtocol?
    
}
extension SABHomeInteractor: SABHomeInteractorInputProtocol {
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
