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
    func remoteDataManagerResponseStatusSendSignature(responseSignature: [SABUserRegisterStepThreeModelResponse]) {
        presenter?.senDataResponseFromDataManger(responseSingnature: responseSignature)
        
    }
    
    // TODO: Implement use case methods
}
extension SABUserRegisterStepThreeInteractor: SABUserRegisterStepThreeInteractorInputProtocol {
    func sendSignatureUserSABInteractor(imageStringSignatureUser: String, customerId:Int) {
        remoteDatamanager?.sendSignatureUserSABRemoteData(imageStringSignatureUser: imageStringSignatureUser, customerId:customerId)
    }
}
