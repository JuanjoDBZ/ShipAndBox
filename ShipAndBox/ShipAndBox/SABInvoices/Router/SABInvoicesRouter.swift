//
//  SABInvoicesRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 03/08/21.
//  
//

import Foundation
import UIKit
 
class SABInvoicesRouter {
    public var view: SABInvoicesVC
    private var presenter: SABInvoicesPresenter
    private var interactor: SABInvoicesInteractor
    init() {
        self.view = SABInvoicesVC()
        self.presenter = SABInvoicesPresenter()
        self.interactor = SABInvoicesInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABInvoicesRouter: SABInvoicesRouterProtocol {
}

