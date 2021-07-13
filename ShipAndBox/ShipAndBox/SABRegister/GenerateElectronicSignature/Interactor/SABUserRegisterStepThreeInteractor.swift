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
    var remoteDatamanager = SABUserRegisterStepThreeRemoteDataManager()
}
extension SABUserRegisterStepThreeInteractor: SABUserRegisterStepThreeInteractorInputProtocol {
    /// Enviar los parametros para que el dataManager ejecute el servicio
    /// - Parameters:
    ///   - imageStringSignatureUser: imagen de la firma en base 64
    ///   - customerId: Id del usuario registrado
    func sendSignatureUserSABInteractor(parametersCreateSignature: NSDictionary) {
        remoteDatamanager.sendSignatureUserSABRemoteData(parametersCreateSignature: parametersCreateSignature, objectType: ToDo.self) { (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                if object.status == 1 {
                    if let msgSucces = object.message?[0]{
                        self.presenter?.responseSuccesRegisterStepThree(msg: msgSucces)
                    }
                } else  {
                    if let msgError = object.message?[0]{
                        self.presenter?.responseErrorRegisterStepThree(msgError: msgError)
                    }
                }
            case .failure(let error):
                self.presenter?.responseErrorRegisterStepThree(msgError: error.localizedDescription)
            }
        }
    }
}
