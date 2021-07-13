//
//  SABRealizaTuPagoProtocol.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 06/07/21.
//  
//
import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABRealizaTuPago
protocol SABRealizaTuPagoViewProtocol {
    // PRESENTER -> VIEW
    /// Funcion que trae los datos de el consumo del presente ala vista
    /// - Parameter resultMembership: Datos de tipos de membresia que utilisaremos para la vista
    func resulsetPaysMembershipView(resultMembership:[dataResultSerive])
}
/// Protocolo que define los métodos y atributos para el routing de SABRealizaTuPago
protocol SABRealizaTuPagoRouterProtocol {
    // PRESENTER -> ROUTING
}
/// Protocolo que define los métodos y atributos para el Presenter de SABRealizaTuPago
protocol SABRealizaTuPagoPresenterProtocol {
    // VIEW -> PRESENTER
    /// Funcion que lleva los datos de la tarjeta del view al presenter 
    /// - Parameter parametersCreateToken: Datos de tarjeta para la creacion de Token
    func openpay(parametersCreateToken: NSDictionary)
    func getTypeMember()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABRealizaTuPago
protocol SABRealizaTuPagoInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    /// Funcion que lleva los datos de la tarjeta del presentar al interactor
    /// - Parameter parametersCreateToken: Datos de tarjeta para la creacion de Token
    func openpayInteractor(parametersCreateToken: NSDictionary)
    func getTypeMemberInteractor()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABRealizaTuPago
protocol SABRealizaTuPagoInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    /// Funcion que trae los datos de el consumo del interactor al presenter
    /// - Parameter resultMembership: Datos de tarjeta para la creacion de Token
    func resulsetPaysMembership(resultMembership:[dataResultSerive])
}

