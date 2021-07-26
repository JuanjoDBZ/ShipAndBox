//
//  SABProfileInteractor.swift
//  ShipAndBox
//
//  Created by ISITA on 21/07/21.
//  
//

import Foundation
/// Estructura para la respuesta del servidor
struct ToDoGetUserProfileData: Decodable {
    /// Resultado de tipo dataResultService que regresa el servidor
    let data: dataResultUserProfile?
    /// Estatus que regresa el servidor(0 o 1)
    let status: Int?
    /// Mensaje de respuesta del servidor
    let message: Array<String>?
}
/// Data que regresa el servidor
struct dataResultUserProfile: Decodable {
    /// Id del usuario
    let customerId: Int?
    /// Nombres del usuario
    let names: String?
    /// Apellidos del usuario
    let surnames: String?
    /// Email del usuario
    let email: String?
    /// Direcciones del usuario
    let addressTax: [dataResultUserProfileAddress]?
    /// Direcciones del usuario
    let address: [dataResultUserProfileAddress]?
    /// Direcciones del usuario
    let pobox: dataResultUserProfilePobox?
}
/// Direcciones del usuario
struct dataResultUserProfileAddress: Decodable {
    /// Id dirección
    let id: Int?
    /// Dirección Calle
    let address: String?
    /// Colonia
    let suburb: String?
    /// Código postal
    let zipcode: String?
    /// Ciudad
    let city: String?
    /// Estado
    let state: String?
    /// Pais
    let country: String?
    /// Tipo de usuario
    let typeUser: String?
    /// Latitud
    let latitude: String?
    /// Longitud
    let longitude: String?
    /// Estatus
    let status: String?
}
/// Direcciones del usuario
struct dataResultUserProfilePobox: Decodable {
    /// Id pobox
    let poboxId: Int?
    /// Numero de dirreción
    let numberPobox: String?
    /// DIrrección pobox
    let addressPobox: String?
}
class SABProfileInteractor {
    var presenter: SABProfileInteractorOutputProtocol?
    var remoteDatamanager = SABProfileRemoteData()
}
extension SABProfileInteractor: SABProfileInteractorInputProtocol {
    /// Función para solicitar la información del usuario
    func getInfoUserProfileIntercator() {
        remoteDatamanager.getDataUserProfile(objectType: ToDoGetUserProfileData.self){ (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                if object.status == 1 {
                    if let data =  object.data, let names = data.names, let surnames = data.surnames, let email = data.email{
                        if let customerId = data.customerId {
                            var dataUserProfile: DataUserProfile = DataUserProfile()
                            dataUserProfile.customerId = customerId
                            dataUserProfile.names = names
                            dataUserProfile.surnames = surnames
                            dataUserProfile.email = email
                            self.presenter?.setDataSucces(data: dataUserProfile)
                        }
                    }
                } else  {
                    if let msgError = object.message?[0]{
                        print(msgError)
                    }
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
