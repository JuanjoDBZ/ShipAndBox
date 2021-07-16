//
//  SABTabBarHomeRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 15/07/21.
//  
//

import Foundation
import UIKit

class SABTabBarHomeRouter {
    public var view: SABTabBarHomeVC
    private var presenter: SABTabBarHomePresenter
    private var interactor: SABTabBarHomeInteractor
    init() {
        self.view = SABTabBarHomeVC()
        self.presenter = SABTabBarHomePresenter()
        self.interactor = SABTabBarHomeInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABTabBarHomeRouter: SABTabBarHomeRouterProtocol {
}

