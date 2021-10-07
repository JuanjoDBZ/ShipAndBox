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
    let Data: dataLoginResultSerive?
    let Status: Int?
    let Message: Array<String>
}
/// Estructura de los informacion recibidos dentro de data
struct dataLoginResultSerive:Decodable  {
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
class SABLoginInteractor {
    var presenter: SABLoginInteractorOutputProtocol?
    var externalData = SABLoginRemoteDataManagerInputProtocol()
}
extension SABLoginInteractor: SABLoginInteractorInputProtocol {
    /// Función para el consumo de servicio de login.
    /// - Parameters:
    ///   - usrEmail: Correo del usuario.
    ///   - usrPassword: Contraseña del usuario.
    func loginUserInteractor(userId: Int, usrPassword: String ) {
        let parameters: NSDictionary = [
                "UserId": userId,
                "password": usrPassword
        ]
//        externalData.GetDatalogin(params: parameters)
        externalData.GetDatalogin(objectType: LoginDecodable.self, params: parameters) { (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                if let data = object.Data {
                    self.presenter?.resulSetLogin(resultLogin: data)
                }
            case .failure(let error):
                print(error)
            }
        }
        
    }
}
