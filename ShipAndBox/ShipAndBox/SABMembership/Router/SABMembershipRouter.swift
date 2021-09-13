//
//  SABMembershipRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 13/09/21.
//  
//

import Foundation
import UIKit

class SABMembershipRouter {
    public var view: SABMembershipVC
    private var presenter: SABMembershipPresenter
    private var interactor: SABMembershipInteractor
    init() {
        self.view = SABMembershipVC()
        self.presenter = SABMembershipPresenter()
        self.interactor = SABMembershipInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABMembershipRouter: SABMembershipRouterProtocol {
}

