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
    /// Iniciar activity
    func showActivity()
    /// Parar activity y ocultar
    func hideActivity()
    /// Funcion para prosesar la respuesta satisfactoria del response
    /// - Parameter msg: mensaje satisfactoria de respuesta
    func resposeSuccesRegisterStepThreeView(msg:String)
    /// Función para mostrar error de respuesta
    /// - Parameter msgError: mensaje de error
    func resposeErrorRegisterStepThreeView(msgError:String)
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
    // PRESENTER -> INTERACTOR
    /// Se envía al interactor el id de l usuario y la imagen de la firma
    /// - Parameter parametersCreateSignature: Se envia la firma y el id del usuario
    func sendSignatureUserSABInteractor(parametersCreateSignature: NSDictionary)
}
/// Protocolo que define los métodos y atributos para el Interactor de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    /// Funcion satisfactoria de respuesta
    /// - Parameter msg: mensaje para mostrar en pantalla
    func responseSuccesRegisterStepThree(msg:String)
    /// Funcion erronea de respuesta
    /// - Parameter msgError: mensaje de error
    func responseErrorRegisterStepThree(msgError:String)
}

