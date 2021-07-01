//
//  SABChangePasswordRouter.swift
//  ShipAndBox
//
//  Created by ISITA on 30/06/21.
//  
//

import Foundation
import UIKit

class SABChangePasswordRouter {
    private var view: SABChangePasswordVC
    private var presenter: SABChangePasswordPresenter
    private var interactor: SABChangePasswordInteractor
    private var window: UIWindow?
    init(in window: UIWindow?) {
        self.view = SABChangePasswordVC()
        self.presenter = SABChangePasswordPresenter()
        self.interactor = SABChangePasswordInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
        self.window = window
    }
    func showView() {
        window?.rootViewController = UINavigationController(rootViewController: view)
        window?.makeKeyAndVisible()
    }
}
extension SABChangePasswordRouter: SABChangePasswordRouterProtocol {
}

