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
    func goToUserRegisterStepFour() {
        router?.showViewUserRegisterStepFour()
    }
    /// Se envía imagen de la firma y el id de usuario al interactor
    /// - Parameter parametersCreateSignature: Se envia la firma y el id del usuario
    func sendSignatureUserSAB(parametersCreateSignature: NSDictionary) {
        interactor?.sendSignatureUserSABInteractor(parametersCreateSignature: parametersCreateSignature)
        view?.showActivity()
    }
}
extension SABUserRegisterStepThreePresenter: SABUserRegisterStepThreeInteractorOutputProtocol {
    /// Se comunica con la vista para enviar los datos de respuesta del servidor, se envia estaus y el mensaje
    /// - Parameter responseSingnature: Respuesta del servidor,  se obtiene estatus y mensaje
    func senDataResponseFromDataManger(responseSingnature: [SABUserRegisterStepThreeModelResponse]) {
        view?.hideActivity()
        view?.getDataInViewSAB(status:responseSingnature[0].status,msg: responseSingnature[0].message[0])
    }
}
