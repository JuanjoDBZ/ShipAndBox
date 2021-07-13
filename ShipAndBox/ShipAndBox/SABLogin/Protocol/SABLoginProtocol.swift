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
}
/// Protocolo que define los métodos y atributos para el routing de SABLogin
protocol SABLoginRouterProtocol {
    // PRESENTER -> ROUTING
}
/// Protocolo que define los métodos y atributos para el Presenter de SABLogin
protocol SABLoginPresenterProtocol {
    // VIEW -> PRESENTER
    /// Función que pasa los datos de la vista al presenter para su manipulación.
    /// - Parameters:
    ///   - usrEmail: Correo del usuario.
    ///   - usrPassword: Contraseña del usuario.
    func loginUser(usrEmail: String, usrPassword: String)
}
/// Protocolo que define los métodos y atributos para el Interactor de SABLogin
protocol SABLoginInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func loginUserInteractor(usrEmail: String, usrPassword: String)
}
/// Protocolo que define los métodos y atributos para el Interactor de SABLogin
protocol SABLoginInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
}

