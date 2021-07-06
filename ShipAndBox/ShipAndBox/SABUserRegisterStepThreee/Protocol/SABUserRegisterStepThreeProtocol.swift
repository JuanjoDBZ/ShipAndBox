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
    func getDataInViewSAB(status:Int,msg:String)
    func showActivity()
    func hideActivity()
}
/// Protocolo que define los métodos y atributos para el routing de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeRouterProtocol {
    // PRESENTER -> ROUTING
    func showViewUserRegisterStepFour()
}
/// Protocolo que define los métodos y atributos para el Presenter de SABUserRegisterStepThree
protocol SABUserRegisterStepThreePresenterProtocol {
    // VIEW -> PRESENTER
    func sendSignatureUserSAB(imageStringSignatureUser:String, customerId:Int)
    func goToUserRegisterStepFour()
}
/// Protocolo que define los métodos y atributos para el Interactor de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeInteractorInputProtocol {
    var remoteDatamanager: SABUserRegisterStepThreeRemoteDataManagerInputProtocol? { get set }
    // PRESENTER -> INTERACTOR
    func sendSignatureUserSABInteractor(imageStringSignatureUser:String,customerId:Int)
}

protocol SABUserRegisterStepThreeRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: SABUserRegisterStepThreeRemoteDataManagerOutputProtocol? { get set }
    func sendSignatureUserSABRemoteData(imageStringSignatureUser:String,customerId:Int)
}

protocol SABUserRegisterStepThreeRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func remoteDataManagerResponseStatusSendSignature(responseSignature: [SABUserRegisterStepThreeModelResponse])
}
/// Protocolo que define los métodos y atributos para el Interactor de SABUserRegisterStepThree
protocol SABUserRegisterStepThreeInteractorOutputProtocol {
    // INTERACTOR -> PRESENTER
    func senDataResponseFromDataManger(responseSingnature: [SABUserRegisterStepThreeModelResponse])
    //func receiveData()
}

