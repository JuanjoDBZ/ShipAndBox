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
    /// Funcion de respuesta satisfactoría
    /// - Parameter data: arreglo con los datos del response
    func succesResponseRegisterNewUser(data: DataUserRegister)
    /// Funcion de respuesta de error
    /// - Parameter error: mensaje de error
    func errorResponseRegisterNewUser(error: String)
}
/// Protocolo que define los métodos y atributos para el routing de SABRegister
protocol SABRegisterRouterProtocol {
    // PRESENTER -> ROUTING
//    func showRequestInformation(documents: [String: String])
    func goToStepTwoUserRegisterR(data: DataUserRegister)
}
/// Protocolo que define los métodos y atributos para el Presenter de SABRegister
protocol SABRegisterPresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
    func validateDocuments(documents: [String: String])
    func showRequestInformation()
    /// Función para ir al paso 2 de registro
    /// - Parameter data: datos de respuesta del servidor
    func goToStepTwoRegisterNewUser(data:DataUserRegister)
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
    /// Funcion de respuesta satisfactoría
    /// - Parameter data: arreglo con los datos del response
    func succesResponseRegisterNewUser(data: DataUserRegister)
    /// Funcion de respuesta de error
    /// - Parameter error: mensaje de error
    func errorResponseRegisterNewUser(error: String)
}
