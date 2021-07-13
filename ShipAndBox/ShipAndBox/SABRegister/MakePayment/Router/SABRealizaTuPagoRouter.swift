//
//  SABRealizaTuPagoRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 06/07/21.
//  
//
import Foundation
import UIKit
class SABRealizaTuPagoRouter {
    public var view: SABRealizaTuPagoVC
    private var presenter: SABRealizaTuPagoPresenter
    private var interactor: SABRealizaTuPagoInteractor
    init() {
        self.view = SABRealizaTuPagoVC()
        self.presenter = SABRealizaTuPagoPresenter()
        self.interactor = SABRealizaTuPagoInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABRealizaTuPagoRouter: SABRealizaTuPagoRouterProtocol {
}

