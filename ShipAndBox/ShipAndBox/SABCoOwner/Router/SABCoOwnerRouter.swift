//
//  SABCoOwnerRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 21/07/21.
//  
//

import Foundation
import UIKit

class SABCoOwnerRouter {
    private var view: SABCoOwnerVC
    private var presenter: SABCoOwnerPresenter
    private var interactor: SABCoOwnerInteractor
    private var window: UIWindow?
    init(in window: UIWindow?) {
        self.view = SABCoOwnerVC()
        self.presenter = SABCoOwnerPresenter()
        self.interactor = SABCoOwnerInteractor()
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
extension SABCoOwnerRouter: SABCoOwnerRouterProtocol {
}

