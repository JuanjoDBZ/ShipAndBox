//
//  RequestInformationRouter.swift
//  ShipAndBox
//
//  Created by Juan Esquivel on 06/07/21.
//  
//

import Foundation
import UIKit

class RequestInformationRouter {
    var view: RequestInformationVC
    private var presenter: RequestInformationPresenter
    private var interactor: RequestInformationInteractor
    init(data:DataUserRegister) {
        self.view = RequestInformationVC()
        self.presenter = RequestInformationPresenter()
        self.interactor = RequestInformationInteractor()
        view.presenter = self.presenter
        view.dataUserRegister = data
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension RequestInformationRouter: RequestInformationRouterProtocol {
    func showViewStepThreeRegister(customerId: Int, dateExpiration: String) {
        let RegisterGenerateSignatureVC = SABUserRegisterStepThreeRouter(customerId:customerId, dateExpiration:dateExpiration).view
        self.view.navigationController?.pushViewController(RegisterGenerateSignatureVC, animated: true)
    }
}

