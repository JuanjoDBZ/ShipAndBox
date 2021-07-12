//
//  SABRegisterProtocol.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABRegister
protocol SABRegisterViewProtocol {
    // PRESENTER -> VIEW
    func loadInfo()
}
/// Protocolo que define los métodos y atributos para el routing de SABRegister
protocol SABRegisterRouterProtocol {
    // PRESENTER -> ROUTING
//    func showRequestInformation(documents: [String: String])
}
/// Protocolo que define los métodos y atributos para el Presenter de SABRegister
protocol SABRegisterPresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
    func validateDocuments(documents: [String: String])
    func showRequestInformation()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABRegister
protocol SABRegisterInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func processInfo()
    func validateDocuments(documents: [String: String])

}
/// Protocolo que define los métodos y atributos para el Interactor de SABRegister
protocol SABRegisterInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
}
