//
//  SABInvoicesRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 02/08/21.
//  
//

import Foundation
import UIKit

class SABInvoicesRouter {
    private var view: SABInvoicesVC
    private var presenter: SABInvoicesPresenter
    private var interactor: SABInvoicesInteractor
    private var window: UIWindow?
    init(in window: UIWindow?) {
        self.view = SABInvoicesVC()
        self.presenter = SABInvoicesPresenter()
        self.interactor = SABInvoicesInteractor()
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
extension SABInvoicesRouter: SABInvoicesRouterProtocol {
}

