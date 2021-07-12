//
//  RequestInformationProtocol.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 06/07/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de RequestInformation
protocol RequestInformationViewProtocol {
    // PRESENTER -> VIEW
    func loadInfo()
}
/// Protocolo que define los métodos y atributos para el routing de RequestInformation
protocol RequestInformationRouterProtocol {
    // PRESENTER -> ROUTING
    //func showNewView()
}
/// Protocolo que define los métodos y atributos para el Presenter de RequestInformation
protocol RequestInformationPresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de RequestInformation
protocol RequestInformationInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func processInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de RequestInformation
protocol RequestInformationInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
}

