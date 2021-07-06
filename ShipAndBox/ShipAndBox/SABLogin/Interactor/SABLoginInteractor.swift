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
    func loginUserInteractor(usrEmail: String, usrPassword: String) {
        let parameters: NSDictionary = [
                "email": usrEmail,
                "password": usrPassword
        ]
//        if let conexionData = externalData {
        externalData.GetDatalogin(params: parameters) { (sucess, response) in
                if sucess{
                    print("funciono")
                }
            }
//        }
    }
}
