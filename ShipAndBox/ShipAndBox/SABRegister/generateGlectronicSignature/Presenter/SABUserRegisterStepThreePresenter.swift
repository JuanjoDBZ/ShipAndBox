//
//  SABUserRegisterStepThreePresenter.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//  
//
import Foundation
class SABUserRegisterStepThreePresenter {
    var view: SABUserRegisterStepThreeViewProtocol?
    var interactor: SABUserRegisterStepThreeInteractorInputProtocol?
    var router: SABUserRegisterStepThreeRouterProtocol?
}
extension SABUserRegisterStepThreePresenter: SABUserRegisterStepThreePresenterProtocol {
    func goToUserRegisterStepFour(customerId:Int) {
        router?.showViewUserRegisterStepFour(customerId:customerId)
    }
    /// Se envía imagen de la firma y el id de usuario al interactor
    /// - Parameter parametersCreateSignature: Se envía la firma y el id del usuario
    func sendSignatureUserSAB(parametersCreateSignature: NSDictionary) {
        interactor?.sendSignatureUserSABInteractor(parametersCreateSignature: parametersCreateSignature)
        view?.showActivity()
    }
}
extension SABUserRegisterStepThreePresenter: SABUserRegisterStepThreeInteractorOutputProtocol {
    /// se obtiene funcionalidad para hacer si la respuesta es satisfactoria
    /// - Parameter msg: mensaje para mostar
    func responseSuccesRegisterStepThree(msg:String) {
        view?.hideActivity()
        view?.resposeSuccesRegisterStepThreeView(msg:msg)
    }
    /// se obtiene funcionalidad para hacer si la respuesta es erronea
    /// - Parameter msgError: mensaje de error
    func responseErrorRegisterStepThree(msgError:String) {
        view?.hideActivity()
        view?.resposeErrorRegisterStepThreeView(msgError:msgError)
    }
}
