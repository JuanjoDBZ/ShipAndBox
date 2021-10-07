//
//  SABLoginRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 30/06/21.
//  
//

import Foundation
import UIKit

class SABLoginRouter {
    public var view: SABLoginVC
    private var presenter: SABLoginPresenter
    private var interactor: SABLoginInteractor
    private var window: UIWindow?
    init() {
        self.view = SABLoginVC()
        self.presenter = SABLoginPresenter()
        self.interactor = SABLoginInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABLoginRouter: SABLoginRouterProtocol {
    /// Ir a pantalla de recuperar contraseña
    func showRecoverPwd() {
        let RecoverPwdVc = SABRecoverPasswordRouter().view
        self.view.navigationController?.pushViewController(RecoverPwdVc, animated: true)
    }
    ///Ir a la pantalla de registro
    func registerNewUserRouter() {
        let registerVC = SABRegisterRouter().view
        self.view.navigationController?.pushViewController(registerVC, animated: true)
    }
    func showHomeRouting() {
        // Tab Bar Customisation
        let tabBar = UITabBarController()
        let sabHomeVC = UINavigationController(rootViewController: SABTabBarHomeRouter().view)
        let factura = UINavigationController(rootViewController: facturaViewContrller())
        let compras = UINavigationController(rootViewController: comprasViewContrller())
        let cotitular = UINavigationController(rootViewController: cotitularViewContrller())
        tabBar.setViewControllers([sabHomeVC,factura,compras,cotitular], animated: true)
        sabHomeVC.tabBarItem.image = UIImage(named: "item")
        factura.tabBarItem.image = UIImage(named: "factura")
        compras.tabBarItem.image = UIImage(named: "house")
        cotitular.tabBarItem.image = UIImage(named: "cotitular")
        tabBar.modalPresentationStyle = .currentContext
        self.view.navigationController?.present(tabBar, animated: true, completion: nil)
    }
}

