//
//  RequestInformationInteractor.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 06/07/21.
//  
//

import Foundation
/// Estructura para la respuesta del servidor
struct ToDoGenerateUser: Decodable {
    /// Resultado de tipo dataResultService que regresa el servidor
    let data: dataResultServiceGenerateUser?
    /// Estatus que regresa el servidor(0 o 1)
    let status: Int?
    /// Mensaje de respuesta del servidor
    let message: Array<String>?
}
/// Data que regresa el servidor
struct dataResultServiceGenerateUser: Decodable {
    //nombre usuario
    let token: String?
    let contractText: String?
    let contractTextPdf: String?
    let poboxName: String?
    let dateExpiration: String?
    let poboxAddress: String?
    let customerId: Int?
}
class RequestInformationInteractor {
    var presenter: RequestInformationInteractorOutputProtocol?
    var remoteDatamanager = RequestIformationRemoteData()
    
}
extension RequestInformationInteractor: RequestInformationInteractorInputProtocol {
    /// Función para prrocesar respuesta del servico
    /// - Parameter data: Datos necesarios para la sugiente pantalla
    func createNewUserPresenter(data: DataUserRegister) {
        remoteDatamanager.registerNewUser(params: data, objectType: ToDoGenerateUser.self) { (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                if object.status == 1 {
                    if let customerId = object.data?.customerId {
                        self.presenter?.sendSuccesResponseToInteractor(customerId: customerId)
                    }
                } else  {
                    if let msgError = object.message?[0]{
                        self.presenter?.sendErrorResponseToInteractor(msgError: msgError)
                    }
                }
            case .failure(let error):
                self.presenter?.sendErrorResponseToInteractor(msgError: error.localizedDescription)
            }
        }
    }
    func processInfo() {
        presenter?.receiveData()
    }
}
