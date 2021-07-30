//  SABRealizaTuPagoInteractor.swift
//  ShipAndBox
//  Created by IsitaFS003 on 06/07/21.
import Foundation
/// Estructura de los datos que recivismos en el servicio
struct ToDoPayDecodable: Codable {
    let data : [dataResultSerive]?
    let status: Int?
    let message: Array<String>
}
/// Estructura de los informacion recibidos dentro de data
struct dataResultSerive: Codable  {
    let id : Int?
    let name : String?
    let cost : Int?
}
class SABRealizaTuPagoInteractor {
    var presenter: SABRealizaTuPagoInteractorOutputProtocol?
    var externalDataManager = SABRealizaTuPagoRemoteDataManagerInputProtocol()
}
extension SABRealizaTuPagoInteractor: SABRealizaTuPagoInteractorInputProtocol {
    /// Funcion que consume el servicio para OpenPay
    /// - Parameter parametersCreateToken: Datos de tarjeta para la creacion de Token
    func openpayInteractor(parametersCreateToken: DataMakePayment) {
        externalDataManager.inicializarOpenPay(parametersCreateToken: parametersCreateToken)
    }
    /// Funcion que consume el servicio getTypePaysMemberships y responde la llamada
    func getTypeMemberInteractor() {
        externalDataManager.getTypePaysMemberships( objectType: ToDoPayDecodable.self) { (result: EnumsRequestAndErrors.Result) in
            switch result {
            case .success(let object):
                if let data = object.data {
                    self.presenter?.resulsetPaysMembership(resultMembership: data)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
