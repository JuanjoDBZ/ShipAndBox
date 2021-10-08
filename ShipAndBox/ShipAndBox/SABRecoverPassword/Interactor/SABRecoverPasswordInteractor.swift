//
//  SABRecoverPasswordInteractor.swift
//  ShipAndBox
//
//  Created by ISITA on 30/08/21.
//  
//

import Foundation
/// Estructura de los datos que recivismos en el servicio
struct RecoverPwdDecodable:Decodable {
    let Data: dataRecoverPwd?
    let Status: Int?
    let Message: Array<String>?
}
/// Estructura de los informacion recibidos dentro de data
struct dataRecoverPwd:Decodable  {
    let CustomerID : Int?
    let Nombre : String?
    let Paterno : String?
    let Materno : String?
    let Email : String?
    let GUID : String?
    let phsec : String?
    let StoreID : String?
    let StoreName : String?
}
class SABRecoverPasswordInteractor {
    var presenter: SABRecoverPasswordInteractorOutputProtocol?
    var remoteDatamanager = SABRecoverPasswordRemoteData()
    
}
extension SABRecoverPasswordInteractor: SABRecoverPasswordInteractorInputProtocol {
    /// Función para enviar email
    /// - Parameter email: email de recuperación
    func recoverPwdInteractor(email: String) {
        let params: NSDictionary = ["email":email]
        remoteDatamanager.sendSignatureUserSABRemoteData(parameters: params, objectType: RecoverPwdDecodable.self) { (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                if object.Status == 1 {
                    if let msgSucces = object.Message?[0]{
                        print("hola succes \(msgSucces)")
                    }
                } else  {
                    if let msgError = object.Message?[0]{
                        print("hola erorr \(msgError)")
                    }
                }
            case .failure(let error):
                print("error")
            }
        }
    }
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
}
