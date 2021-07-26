//
//  PlaceHolderCollectionViewCellProtocol.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 23/07/21.
//
import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABCoOwner
protocol PlaceHolderCollectionViewCellViewProtocol {
    // PRESENTER -> VIEW
}
/// Protocolo que define los métodos y atributos para el routing de SABCoOwner
protocol PlaceHolderCollectionViewCellRouterProtocol {
    // PRESENTER -> ROUTING
    func createNewCoOwner()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABCoOwner
protocol PlaceHolderCollectionViewCellPresenterProtocol {
    // VIEW -> PRESENTER
    func newCoOwner()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABCoOwner
protocol PlaceHolderCollectionViewCellInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
}
/// Protocolo que define los métodos y atributos para el Interactor de SABCoOwner
protocol PlaceHolderCollectionViewCellInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
}
