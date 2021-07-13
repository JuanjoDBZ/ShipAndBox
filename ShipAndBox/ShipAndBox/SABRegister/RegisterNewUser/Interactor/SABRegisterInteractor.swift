//
//  SABRegisterInteractor.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//
import Foundation
struct ToDoRegister: Decodable {
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
        externalDataManager.autenticar(with: documents, objectType: ToDoRegister.self) { (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                print(object)
            case .failure(let error):
                print(error)
            }
        }
    }
}
