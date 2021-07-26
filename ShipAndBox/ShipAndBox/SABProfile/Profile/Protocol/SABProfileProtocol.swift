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
    func setDataSuccesInView(data:DataUserProfile)
}
/// Protocolo que define los métodos y atributos para el routing de SABProfile
protocol SABProfileRouterProtocol {
    // PRESENTER -> ROUTING
}
/// Protocolo que define los métodos y atributos para el Presenter de SABProfile
protocol SABProfilePresenterProtocol {
    // VIEW -> PRESENTER
    /// Solicitar la onformación del usuario
    func getInfoUserProfile()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABProfile
protocol SABProfileInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func getInfoUserProfileIntercator()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABProfile
protocol SABProfileInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func setDataSucces(data:DataUserProfile)
}

