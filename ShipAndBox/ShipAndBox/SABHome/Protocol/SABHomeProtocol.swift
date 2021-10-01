//
//  SABHomeProtocol.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABHome
protocol SABHomeViewProtocol {
    // PRESENTER -> VIEW
    func loadInfo()
}
/// Protocolo que define los métodos y atributos para el routing de SABHome
protocol SABHomeRouterProtocol {
    // PRESENTER -> ROUTING
    func showWebViewSab()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABHome
protocol SABHomePresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
    func openWebViewSab()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABHome
protocol SABHomeInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func processInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABHome
protocol SABHomeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
}

