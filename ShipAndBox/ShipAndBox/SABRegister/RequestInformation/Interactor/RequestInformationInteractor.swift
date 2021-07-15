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
    let names: String?
}
class RequestInformationInteractor {
    var presenter: RequestInformationInteractorOutputProtocol?
    var remoteDatamanager = RequestIformationRemoteData()
    
}
extension RequestInformationInteractor: RequestInformationInteractorInputProtocol {
    func createNewUserPresenter(data: DataUserRegister) {
        remoteDatamanager.registerNewUser(params: data, objectType: ToDoGenerateUser.self) { (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                print(object)
                if object.status == 1 {
                    if let msgSucces = object.message?[0]{
                        print(msgSucces)
                        self.presenter?.sendSuccesResponseToInteractor(customerId: 2)
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
    
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
