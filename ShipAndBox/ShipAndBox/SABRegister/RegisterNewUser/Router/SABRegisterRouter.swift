//
//  SABRegisterRouter.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 01/07/21.
//  
//

import Foundation
import UIKit

class SABRegisterRouter {
    var view: SABRegisterVC
    private var presenter: SABRegisterPresenter
    private var interactor: SABRegisterInteractor
    init() {
        self.view = SABRegisterVC()
        self.presenter = SABRegisterPresenter()
        self.interactor = SABRegisterInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABRegisterRouter: SABRegisterRouterProtocol {
    func goToStepTwoUserRegisterR(data: DataUserRegister) {
        let RegisterStepTwoVC = RequestInformationRouter(data: data).view
        self.view.navigationController?.pushViewController(RegisterStepTwoVC, animated: true)
    }
    
    /* Para mostrar una nueva pantalla con navigation controller.*/
//    func showRequestInformation(documents: [String: String]) {
//        let requestInformationVC = RequestInformationRouter(documents: documents).view
//        self.view.navigationController?.pushViewController(requestInformationVC, animated: true)
//    }
}

