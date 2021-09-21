//
//  SABCreateAccountProtocol.swift
//  ShipAndBox
//
//  Created by ISITA on 31/08/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABCreateAccount
protocol SABCreateAccountViewProtocol {
    // PRESENTER -> VIEW
    func loadInfo()
}
/// Protocolo que define los métodos y atributos para el routing de SABCreateAccount
protocol SABCreateAccountRouterProtocol {
    // PRESENTER -> ROUTING
    //func showNewView()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABCreateAccount
protocol SABCreateAccountPresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABCreateAccount
protocol SABCreateAccountInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func processInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABCreateAccount
protocol SABCreateAccountInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
}

