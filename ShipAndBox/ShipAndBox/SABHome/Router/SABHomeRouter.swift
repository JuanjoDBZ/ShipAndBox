//
//  SABHomeRouter.swift
//  ShipAndBox
//
//  Created by ISITA on 01/10/21.
//  
//

import Foundation
import UIKit

class SABHomeRouter {
    public var view: SABHomeVC
    private var presenter: SABHomePresenter
    private var interactor: SABHomeInteractor
    private var window: UIWindow?
    init() {
        self.view = SABHomeVC()
        self.presenter = SABHomePresenter()
        self.interactor = SABHomeInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABHomeRouter: SABHomeRouterProtocol {
    /// Función para abrir la webview
    func showWebViewSab() {
        let webViewSab = SABWWebViewHomeRouter().view
        self.view.navigationController?.pushViewController(webViewSab, animated: true)
    }
}

