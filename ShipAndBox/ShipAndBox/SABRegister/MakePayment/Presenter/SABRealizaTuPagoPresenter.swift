//
//  SABRealizaTuPagoPresenter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 06/07/21.
//  
//
import Foundation
class SABRealizaTuPagoPresenter {
    var view: SABRealizaTuPagoViewProtocol?
    var interactor: SABRealizaTuPagoInteractorInputProtocol?
    var router: SABRealizaTuPagoRouterProtocol?
}
extension SABRealizaTuPagoPresenter: SABRealizaTuPagoPresenterProtocol {
    /// Funcion que pasa la informacion del presenter al interactor para el consumo del servicio
    /// - Parameter parametersCreateToken: Datos de tarjeta para la creacion de Token
    func openpay(parametersCreateToken: DataMakePayment) {
        interactor?.openpayInteractor(parametersCreateToken: parametersCreateToken)
    }
    /// Funcion que manda llamar metodo para el consumo del servicio getTypePaysMemberships
    func getTypeMember() {
        interactor?.getTypeMemberInteractor()
    }
}
extension SABRealizaTuPagoPresenter: SABRealizaTuPagoInteractorOutputProtocol {
    /// Funcion para enviar los datos de tipo de membresia al view
    /// - Parameter resultMembership: Parametro con los datos con las diferentes membresias
    func resulsetPaysMembership(resultMembership: [dataResultSerive]) {
        view?.resulsetPaysMembershipView(resultMembership: resultMembership)
    }
}
