//
//  SABUserRegisterStepThreeRouter.swift
//  ShipAndBox
//
//  Created by ISITA on 01/07/21.
//  
//

import Foundation
import UIKit
class SABUserRegisterStepThreeRouter {
    public var view: SABUserRegisterStepThreeVC
    private var presenter: SABUserRegisterStepThreePresenter
    private var interactor: SABUserRegisterStepThreeInteractor
    init(customerId: Int, dateExpiration:String) {
        self.view = SABUserRegisterStepThreeVC()
        self.presenter = SABUserRegisterStepThreePresenter()
        self.interactor = SABUserRegisterStepThreeInteractor()
        view.presenter = self.presenter
        view.dateExpiration = dateExpiration
        view.customerId = customerId
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABUserRegisterStepThreeRouter: SABUserRegisterStepThreeRouterProtocol {
    /// Mandar a la siguiente vista del paso 4 del registro
    /// - Parameter customerId: id del usuario
    func showViewUserRegisterStepFour(customerId:Int) {
        let RegisterStepFourVC = SABRealizaTuPagoRouter(customerId:customerId).view
        self.view.navigationController?.pushViewController(RegisterStepFourVC, animated: true)
    }
}

