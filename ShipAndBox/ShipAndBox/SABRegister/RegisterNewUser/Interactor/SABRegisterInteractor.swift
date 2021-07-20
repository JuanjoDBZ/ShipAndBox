//
//  SABRegisterInteractor.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//
import Foundation
/// Estructura para decodear la respuesta del servidor
struct ToDoRegisterResponse: Decodable {
    ///Resultado de tipo dataResultService que regresa el servidor
    let data: dataResultServiceRegister?
    /// Estatus que regresa el servidor(0 o 1)
    let status: Int?
    /// Mensaje de respuesta del servidor
    let message: Array<String>?
}
///Estructura para decodear la respuesta del servidor
struct dataResultServiceRegister: Decodable {
    /// Nombre
    let names: String?
    /// Apellidos
    let surnames: String?
    /// Tipo de documento
    let typeDocument: String?
    /// Validar documento
    let validDocument: String?
    /// id del documento
    let idNumberDocument: String?
    /// Fecha de expiración
    let dateExpiration: String?
    /// Número personal
    let personalNumber: String?
}
class SABRegisterInteractor {
    var presenter: SABRegisterInteractorOutputProtocol?
    var externalDataManager = ExternalDataManager()
}
extension SABRegisterInteractor: SABRegisterInteractorInputProtocol {
    func processInfo() {
        presenter?.receiveData()
    }
    /// Función par rocesar la respuesta del servidor
    /// - Parameter documents: Parametros para crear el registro
    func validateDocuments(documents: [String: String]) {
        externalDataManager.autenticar(with: documents, objectType: ToDoRegisterResponse.self) { (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                if object.status == 1 {
                    if let data =  object.data{
                        if let names = data.names, let surnames = data.surnames,
                           let typeDocument = data.typeDocument, let idNumberIne = data.idNumberDocument,
                           let dateExpirationIne = data.dateExpiration, let frontIne = documents["IneFront"],
                           let backIne = documents["IneBack"], let facePhoto = documents["FaceCustomer"] {
                            var dataUserRegister: DataUserRegister = DataUserRegister()
                            dataUserRegister.names = names
                            dataUserRegister.surnames = surnames
                            dataUserRegister.typeDocument = typeDocument
                            dataUserRegister.idNumberIne = idNumberIne
                            dataUserRegister.dateExpirationIne = dateExpirationIne
                            dataUserRegister.frontIne = frontIne
                            dataUserRegister.backIne = backIne
                            dataUserRegister.facePhoto = facePhoto
                            self.presenter?.succesResponseRegisterNewUser(data:dataUserRegister)
                        }
                    }
                } else {
                    if let error = object.message?[0]{
                        self.presenter?.errorResponseRegisterNewUser(error: error)
                    }
                }
            case .failure(let error):
                self.presenter?.errorResponseRegisterNewUser(error: error.localizedDescription)
            }
        }
    }
}
