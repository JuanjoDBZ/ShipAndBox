//
//  SABCreateAccountInteractor.swift
//  ShipAndBox
//
//  Created by ISITA on 31/08/21.
//  
//

import Foundation

class SABCreateAccountInteractor {
    var presenter: SABCreateAccountInteractorOutputProtocol?
    
}
extension SABCreateAccountInteractor: SABCreateAccountInteractorInputProtocol {
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
