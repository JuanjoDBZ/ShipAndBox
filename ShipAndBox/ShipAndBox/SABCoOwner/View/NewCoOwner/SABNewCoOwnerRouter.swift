//
//  SABNewCoOwnerRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 26/07/21.
//  
//

import Foundation
import UIKit

class SABNewCoOwnerRouter {
    public var view: SABNewCoOwnerVC
    private var presenter: SABNewCoOwnerPresenter
    private var interactor: SABNewCoOwnerInteractor
    init() {
        self.view = SABNewCoOwnerVC()
        self.presenter = SABNewCoOwnerPresenter()
        self.interactor = SABNewCoOwnerInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABNewCoOwnerRouter: SABNewCoOwnerRouterProtocol {
}

