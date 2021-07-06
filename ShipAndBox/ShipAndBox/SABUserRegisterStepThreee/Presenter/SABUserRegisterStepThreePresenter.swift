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
    
    //Se envian los prametros para obtener la firma digital
    func sendSignatureUserSAB(imageStringSignatureUser:String, customerId:Int) {
        interactor?.sendSignatureUserSABInteractor(imageStringSignatureUser: imageStringSignatureUser, customerId:customerId)
        view?.showActivity()
    }
}
extension SABUserRegisterStepThreePresenter: SABUserRegisterStepThreeInteractorOutputProtocol {
    func senDataResponseFromDataManger(responseSingnature: [SABUserRegisterStepThreeModelResponse]) {
        print(responseSingnature)
        //Se envian los resultados obtenidos del interactor para mostrarlos en la vista
        view?.hideActivity()
        view?.getDataInViewSAB(status:responseSingnature[0].status,msg: responseSingnature[0].message[0])
        
    }
    
}
