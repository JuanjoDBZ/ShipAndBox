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
    /// Se obtiene la respuesta del dataManager y se envía al presenter
    /// - Parameter responseSignature: Respuesta del servidor
    func remoteDataManagerResponseStatusSendSignature(responseSignature: [SABUserRegisterStepThreeModelResponse]) {
        presenter?.senDataResponseFromDataManger(responseSingnature: responseSignature)
    }
    // TODO: Implement use case methods
}
extension SABUserRegisterStepThreeInteractor: SABUserRegisterStepThreeInteractorInputProtocol {
    /// Enviar los parametros para que el dataManager ejecute el servicio
    /// - Parameters:
    ///   - imageStringSignatureUser: imagen de la firma en base 64
    ///   - customerId: Id del usuario registrado
    func sendSignatureUserSABInteractor(parametersCreateSignature: NSDictionary) {
        remoteDatamanager?.sendSignatureUserSABRemoteData(parametersCreateSignature: parametersCreateSignature)
    }
}
