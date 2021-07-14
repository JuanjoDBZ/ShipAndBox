//
//  SABRegisterInteractor.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//
import Foundation
struct ToDoRegisterResponse: Decodable {
    let data: dataResultServiceRegister?
    let status: Int?
    let message: Array<String>?
}
struct dataResultServiceRegister: Decodable {
    let names: String?
    let surnames: String?
    let typeDocument: String?
    let validDocument: String?
    let idNumberDocument: String?
    let dateExpiration: String?
    let personalNumber: String?
}
class SABRegisterInteractor {
    var presenter: SABRegisterInteractorOutputProtocol?
    var externalDataManager = ExternalDataManager()
}
extension SABRegisterInteractor: SABRegisterInteractorInputProtocol {
    //Uso y nombre opcional
    func processInfo() {
        presenter?.receiveData()
    }
    func validateDocuments(documents: [String: String]) {
        externalDataManager.autenticar(with: documents, objectType: ToDoRegisterResponse.self) { (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                if object.status == 1 {
                    if let data =  object.data{
                        var dataUserRegister: DataUserRegister = DataUserRegister()
                        dataUserRegister.names = data.names ?? ""
                        dataUserRegister.surnames = data.surnames ?? ""
                        dataUserRegister.typeDocument = data.typeDocument ?? ""
                        dataUserRegister.idNumberIne = data.idNumberDocument ?? ""
                        dataUserRegister.dateExpirationIne = data.dateExpiration ?? ""
                        dataUserRegister.frontIne = documents["IneFront"] ?? ""
                        dataUserRegister.backIne = documents["IneBack"] ?? ""
                        dataUserRegister.facePhoto = documents["FaceCustomer"] ?? ""
                        self.presenter?.succesResponseRegisterNewUser(data:dataUserRegister)
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
