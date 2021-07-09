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
    /// Se envía a la vista el estatus de la respuesta del servidor
    /// - Parameters:
    ///   - status: estaus de la respuesta
    ///   - msg: mensaje de respuesta
    func getDataInViewSAB(status:Int,msg:String)
    /// Iniciar activity
    func showActivity()
    /// Parar activity y ocultar
    func hideActivity()
}
/// Protocolo que define los métodos y atributos para el routing de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeRouterProtocol {
    // PRESENTER -> ROUTING
    /// Función para ir al paso 4 de registro
    func showViewUserRegisterStepFour()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABUserRegisterStepThree
protocol SABUserRegisterStepThreePresenterProtocol {
    // VIEW -> PRESENTER
    /// Se envía al presenter el id de l usuario y la imagen de la firma
    /// - Parameter parametersCreateSignature: Se envia la firma y el id del usuario
    func sendSignatureUserSAB(parametersCreateSignature: NSDictionary)
    /// Función para decirle al presenter que vamos a  ir al paso 4 de registro
    func goToUserRegisterStepFour()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeInteractorInputProtocol {
    var remoteDatamanager: SABUserRegisterStepThreeRemoteDataManagerInputProtocol? { get set }
    // PRESENTER -> INTERACTOR
    /// Se envía al interactor el id de l usuario y la imagen de la firma
    /// - Parameter parametersCreateSignature: Se envia la firma y el id del usuario
    func sendSignatureUserSABInteractor(parametersCreateSignature: NSDictionary)
}

protocol SABUserRegisterStepThreeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SABUserRegisterStepThreeRemoteDataManagerOutputProtocol? { get set }
    /// Se envía al dataManager el id de l usuario y la imagen de la firma
    /// - Parameter parametersCreateSignature: Se envia la firma y el id del usuario
    func sendSignatureUserSABRemoteData(parametersCreateSignature: NSDictionary)
}

protocol SABUserRegisterStepThreeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    /// El interactor obtiene a respuesta del servidor
    /// - Parameter responseSignature: respuesta del servidor
    func remoteDataManagerResponseStatusSendSignature(responseSignature: [SABUserRegisterStepThreeModelResponse])
}
/// Protocolo que define los métodos y atributos para el Interactor de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    /// Interactor comunica al presenter la respuesta del servidor
    /// - Parameter responseSingnature: respuesta del servidor
    func senDataResponseFromDataManger(responseSingnature: [SABUserRegisterStepThreeModelResponse])
}

