//
//  SABLoginInteractor.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 30/06/21.
//  
//
import Foundation
class SABLoginInteractor {
    var presenter: SABLoginInteractorOutputProtocol?
    var externalData = SABLoginRemoteDataManagerInputProtocol()
}
extension SABLoginInteractor: SABLoginInteractorInputProtocol {
    /// Funcion para el consumo de servicio de login
    /// - Parameters:
    ///   - usrEmail: Correo del usuario
    ///   - usrPassword: Contraseña del usuario
    func loginUserInteractor(usrEmail: String, usrPassword: String) {
        let parameters: NSDictionary = [
                "email": usrEmail,
                "password": usrPassword
        ]
        externalData.GetDatalogin(params: parameters)
    }
}
