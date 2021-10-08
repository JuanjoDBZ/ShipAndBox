//
//  SABRecoverPasswordProtocol.swift
//  ShipAndBox
//
//  Created by ISITA on 30/08/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABRecoverPassword
protocol SABRecoverPasswordViewProtocol {
    // PRESENTER -> VIEW
    func loadInfo()
}
/// Protocolo que define los métodos y atributos para el routing de SABRecoverPassword
protocol SABRecoverPasswordRouterProtocol {
    // PRESENTER -> ROUTING
    //func showNewView()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABRecoverPassword
protocol SABRecoverPasswordPresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
    /// Función para decirle al presenter que envie el correo
    /// - Parameter email: correo de recuperación
    func recoverPassword(email:String)
}
/// Protocolo que define los métodos y atributos para el Interactor de SABRecoverPassword
protocol SABRecoverPasswordInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func processInfo()
    /// Función para recuperar contraseña
    /// - Parameter email: correo de recuperación
    func recoverPwdInteractor(email:String)
}
/// Protocolo que define los métodos y atributos para el Interactor de SABRecoverPassword
protocol SABRecoverPasswordInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
}

