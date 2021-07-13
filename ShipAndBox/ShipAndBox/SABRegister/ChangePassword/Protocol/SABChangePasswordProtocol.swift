//
//  SABChangePasswordProtocol.swift
//  ShipAndBox
//
//  Created by ISITA on 30/06/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABChangePassword
protocol SABChangePasswordViewProtocol {
    // PRESENTER -> VIEW
    func loadInfo()
}
/// Protocolo que define los métodos y atributos para el routing de SABChangePassword
protocol SABChangePasswordRouterProtocol {
    // PRESENTER -> ROUTING
    //func showNewView()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABChangePassword
protocol SABChangePasswordPresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABChangePassword
protocol SABChangePasswordInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func processInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABChangePassword
protocol SABChangePasswordInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
}

