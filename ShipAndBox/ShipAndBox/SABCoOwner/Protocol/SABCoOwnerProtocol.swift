//  SABCoOwnerProtocol.swift
//  ShipAndBox
//  Created by IsitaFS003 on 21/07/21.
import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABCoOwner
protocol SABCoOwnerViewProtocol {
    // PRESENTER -> VIEW
}
/// Protocolo que define los métodos y atributos para el routing de SABCoOwner
protocol SABCoOwnerRouterProtocol {
    // PRESENTER -> ROUTING
    /// funcion que muestra la vista SABNewCoOwner
    func createNewCoOwner()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABCoOwner
protocol SABCoOwnerPresenterProtocol {
    // VIEW -> PRESENTER
    /// funcion que muestra la vista SABNewCoOwner
    func newCoOwner()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABCoOwner
protocol SABCoOwnerInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
}
/// Protocolo que define los métodos y atributos para el Interactor de SABCoOwner
protocol SABCoOwnerInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
}
