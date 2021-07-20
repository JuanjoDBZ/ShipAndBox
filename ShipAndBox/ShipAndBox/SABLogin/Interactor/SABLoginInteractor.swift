//
//  SABLoginInteractor.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 30/06/21.
//  
//
import Foundation
/// Estructura de los datos que recivismos en el servicio
struct LoginDecodable:Decodable {
    let data: dataLoginResultSerive?
    let status: Int?
    let message: Array<String>
}
/// Estructura de los informacion recibidos dentro de data
struct dataLoginResultSerive:Decodable  {
    let email : String?
    let token : String?
    let typeUser : String?
    let names : String?
    let surNames : String?
    let statusMembership : String?
}
class SABLoginInteractor {
    var presenter: SABLoginInteractorOutputProtocol?
    var externalData = SABLoginRemoteDataManagerInputProtocol()
}
extension SABLoginInteractor: SABLoginInteractorInputProtocol {
    /// Función para el consumo de servicio de login.
    /// - Parameters:
    ///   - usrEmail: Correo del usuario.
    ///   - usrPassword: Contraseña del usuario.
    func loginUserInteractor(usrEmail: String, usrPassword: String ) {
        let parameters: NSDictionary = [
                "email": usrEmail,
                "password": usrPassword
        ]
//        externalData.GetDatalogin(params: parameters)
        externalData.GetDatalogin(objectType: LoginDecodable.self, params: parameters) { (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                if let data = object.data {
                    self.presenter?.resulSetLogin(resultLogin: data)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
