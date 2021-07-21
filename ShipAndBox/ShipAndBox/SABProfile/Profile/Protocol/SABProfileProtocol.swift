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
    func loadInfo()
}
/// Protocolo que define los métodos y atributos para el routing de SABProfile
protocol SABProfileRouterProtocol {
    // PRESENTER -> ROUTING
    //func showNewView()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABProfile
protocol SABProfilePresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABProfile
protocol SABProfileInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func processInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABProfile
protocol SABProfileInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
}

