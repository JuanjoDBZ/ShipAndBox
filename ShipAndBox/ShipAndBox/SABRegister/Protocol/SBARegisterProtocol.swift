//
//  SBARegisterProtocol.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 30/06/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SBARegister
protocol SBARegisterViewProtocol {
    // PRESENTER -> VIEW
    func loadInfo()
}
/// Protocolo que define los métodos y atributos para el routing de SBARegister
protocol SBARegisterRouterProtocol {
    // PRESENTER -> ROUTING
    //func showNewView()
}
/// Protocolo que define los métodos y atributos para el Presenter de SBARegister
protocol SBARegisterPresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SBARegister
protocol SBARegisterInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func processInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SBARegister
protocol SBARegisterInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
}

