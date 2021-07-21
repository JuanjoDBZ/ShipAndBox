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
    ///Ir a la pantalla de registro
    func registerNewUserRouter() {
        let registerVC = SABRegisterRouter().view
        self.view.navigationController?.pushViewController(registerVC, animated: true)
    }
    /// Muestra la pantalla de inicio
    func showHomeRouting() {
        // Tab Bar Customisation
        let tabBar = UITabBarController()
        let homeVC = UINavigationController(rootViewController: SABTabBarHomeRouter().view)
        let invoice = UINavigationController(rootViewController: facturaViewContrller())
        let purchases = UINavigationController(rootViewController: comprasViewContrller())
        let coOwner = UINavigationController(rootViewController: cotitularViewContrller())
        tabBar.setViewControllers([homeVC,invoice,purchases,coOwner], animated: true)
        homeVC.tabBarItem.image = UIImage(named: "item")
        invoice.tabBarItem.image = UIImage(named: "factura")
        purchases.tabBarItem.image = UIImage(named: "house")
        coOwner.tabBarItem.image = UIImage(named: "cotitular")
        tabBar.modalPresentationStyle = .currentContext
        self.view.navigationController?.present(tabBar, animated: true, completion: nil)
    }
}

