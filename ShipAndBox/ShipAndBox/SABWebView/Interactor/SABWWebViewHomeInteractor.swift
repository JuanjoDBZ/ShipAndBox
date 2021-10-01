//
//  SABWWebViewHomeInteractor.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//

import Foundation

class SABWWebViewHomeInteractor {
    var presenter: SABWWebViewHomeInteractorOutputProtocol?
    
}
extension SABWWebViewHomeInteractor: SABWWebViewHomeInteractorInputProtocol {
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
