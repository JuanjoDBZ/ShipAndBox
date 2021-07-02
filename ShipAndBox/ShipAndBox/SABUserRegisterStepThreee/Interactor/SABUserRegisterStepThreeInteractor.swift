//
//  SABUserRegisterStepThreeInteractor.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//  
//

import Foundation

class SABUserRegisterStepThreeInteractor {
    var presenter: SABUserRegisterStepThreeInteractorOutputProtocol?
    var remoteDatamanager: SABUserRegisterStepThreeRemoteDataManagerInputProtocol?
    
}

extension SABUserRegisterStepThreeInteractor: SABUserRegisterStepThreeRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
extension SABUserRegisterStepThreeInteractor: SABUserRegisterStepThreeInteractorInputProtocol {
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
