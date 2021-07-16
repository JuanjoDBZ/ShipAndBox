//
//  SABLoginProtocol.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 30/06/21.
//  
//
import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABLogin
protocol SABLoginViewProtocol {
    // PRESENTER -> VIEW
    /// Función que trae los datos del servicio login ala vista
    /// - Parameter resultLogin: Datos de servicio login
    func resulSetLoginView(resultLogin:dataLoginResultSerive)
}
/// Protocolo que define los métodos y atributos para el routing de SABLogin
protocol SABLoginRouterProtocol {
    // PRESENTER -> ROUTING
    /// funcion que muestra la vista Home
    func showHomeRouting()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABLogin
protocol SABLoginPresenterProtocol {
    // VIEW -> PRESENTER
    /// Función que pasa los datos de la vista al presenter para su manipulación.
    /// - Parameters:
    ///   - usrEmail: Correo del usuario.
    ///   - usrPassword: Contraseña del usuario.
    func loginUser(usrEmail: String, usrPassword: String)
    /// Funcion para mostrar la vista Home
    func showHome()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABLogin
protocol SABLoginInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    /// Función que pasa los datos para la llamada de servicio login
    /// - Parameters:
    ///   - usrEmail: Correo del usuario.
    ///   - usrPassword: Contraseña del usuario.
    func loginUserInteractor(usrEmail: String, usrPassword: String)
}
/// Protocolo que define los métodos y atributos para el Interactor de SABLogin
protocol SABLoginInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    /// Función que trae los datos del servicio login al presenter
    /// - Parameter resultLogin: Datos de respuesta servicio login
    func resulSetLogin(resultLogin:dataLoginResultSerive)
}

