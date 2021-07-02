//
//  SABUserRegisterStepThreeProtocol.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//  
//

import Foundation
import UIKit
/// Protocolo que define los métodos y atributos para el view de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeViewProtocol {
    // PRESENTER -> VIEW
    func loadInfo()
}
/// Protocolo que define los métodos y atributos para el routing de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeRouterProtocol {
    // PRESENTER -> ROUTING
    //func showNewView()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABUserRegisterStepThree
protocol SABUserRegisterStepThreePresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeInteractorInputProtocol {
    var remoteDatamanager: SABUserRegisterStepThreeRemoteDataManagerInputProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func processInfo()
}

protocol SABUserRegisterStepThreeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SABUserRegisterStepThreeRemoteDataManagerOutputProtocol? { get set }
}

protocol SABUserRegisterStepThreeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}
/// Protocolo que define los métodos y atributos para el Interactor de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
}

