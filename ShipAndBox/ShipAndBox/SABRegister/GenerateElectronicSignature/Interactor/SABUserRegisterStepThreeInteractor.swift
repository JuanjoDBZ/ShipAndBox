//
//  SABUserRegisterStepThreeInteractor.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//  
//
import Foundation
/// Estructura para la respuesta del servidor
struct ToDoGenerateSignature: Decodable {
    /// Resultado de tipo dataResultService que regresa el servidor
    let data: dataResultServiceGenerateSignature?
    /// Estatus que regresa el servidor(0 o 1)
    let status: Int?
    /// Mensaje de respuesta del servidor
    let message: Array<String>?
}
/// Data que regresa el servidor
struct dataResultServiceGenerateSignature: Decodable {
    //nombre usuario
    let names: String?
}

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
        remoteDatamanager.sendSignatureUserSABRemoteData(parametersCreateSignature: parametersCreateSignature, objectType: ToDoGenerateSignature.self) { (result: EnumsRequestAndErrors.Result) in
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
