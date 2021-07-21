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
    func sendSuccesResponseToView(customerId:Int, dateExpiration:String)
    func sendErrorResponseToView(msgError:String)
}
/// Protocolo que define los métodos y atributos para el routing de RequestInformation
protocol RequestInformationRouterProtocol {
    // PRESENTER -> ROUTING
    //func showNewView()
    func showViewStepThreeRegister(customerId:Int, dateExpiration:String)
}
/// Protocolo que define los métodos y atributos para el Presenter de RequestInformation
protocol RequestInformationPresenterProtocol {
    // VIEW -> PRESENTER
    func getInitialInfo()
    /// Función para decirle al presenter que vamos a crear un nuevo usuario
    /// - Parameter data: datos para crear usuario
    func createNewUserView(data:DataUserRegister)
    func goToStepThreeRegister(customerId:Int, dateExpiration:String)
}
/// Protocolo que define los métodos y atributos para el Interactor de RequestInformation
protocol RequestInformationInteractorInputProtocol {
    // PRESENTER -> INTERACTOR
    func processInfo()
    /// Función para decirle al presenter que vamos a crear un nuevo usuario
    /// - Parameter data: datos para crear usuario
    func createNewUserPresenter(data:DataUserRegister)
}
/// Protocolo que define los métodos y atributos para el Interactor de RequestInformation
protocol RequestInformationInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func receiveData()
    func sendSuccesResponseToInteractor(customerId:Int, dateExpiration:String)
    func sendErrorResponseToInteractor(msgError:String)
}

