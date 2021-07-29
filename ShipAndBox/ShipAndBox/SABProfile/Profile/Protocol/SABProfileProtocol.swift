//
//  SABProfileProtocol.swift
//  ShipAndBox
//
//  Created by ISITA on 21/07/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABProfile
protocol SABProfileViewProtocol {
    // PRESENTER -> VIEW
    /// Enviar a la vista datos del usuario
    /// - Parameter data: Datos del usuario
    func setDataSuccesInView(data:DataUserProfile)
}
/// Protocolo que define los métodos y atributos para el routing de SABProfile
protocol SABProfileRouterProtocol {
    // PRESENTER -> ROUTING
    /// Ir a la pantalla de editar perfil
    /// - Parameter data: Datos del usuario
    func editUserProfileRouter(data:DataUserProfile)
}
/// Protocolo que define los métodos y atributos para el Presenter de SABProfile
protocol SABProfilePresenterProtocol {
    // VIEW -> PRESENTER
    /// Solicitar la onformación del usuario
    func getInfoUserProfile()
    /// Ir a la pantalla de editar perfil
    /// - Parameter data: Datos del usuario
    func editUserProfile(data:DataUserProfile)
}
/// Protocolo que define los métodos y atributos para el Interactor de SABProfile
protocol SABProfileInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    /// Decir al interector que traiga los datos del usuario
    func getInfoUserProfileIntercator()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABProfile
protocol SABProfileInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    /// Obtener datos del usuario
    /// - Parameter data: Datos del usuario
    func setDataSucces(data:DataUserProfile)
}

