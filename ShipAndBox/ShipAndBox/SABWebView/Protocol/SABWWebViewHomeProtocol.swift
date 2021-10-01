//
//  SABWWebViewHomeProtocol.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABWWebViewHome
protocol SABWWebViewHomeViewProtocol {
    // PRESENTER -> VIEW
    func loadInfo()
}
/// Protocolo que define los métodos y atributos para el routing de SABWWebViewHome
protocol SABWWebViewHomeRouterProtocol {
    // PRESENTER -> ROUTING
    //func showNewView()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABWWebViewHome
protocol SABWWebViewHomePresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABWWebViewHome
protocol SABWWebViewHomeInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func processInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABWWebViewHome
protocol SABWWebViewHomeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
}

