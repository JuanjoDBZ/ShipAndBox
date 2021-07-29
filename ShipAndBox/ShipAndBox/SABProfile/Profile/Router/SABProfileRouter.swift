//
//  SABProfileRouter.swift
//  ShipAndBox
//
//  Created by ISITA on 21/07/21.
//  
//

import Foundation
import UIKit

class SABProfileRouter {
    public var view: SABProfileVC
    private var presenter: SABProfilePresenter
    private var interactor: SABProfileInteractor
    init() {
        self.view = SABProfileVC()
        self.presenter = SABProfilePresenter()
        self.interactor = SABProfileInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABProfileRouter: SABProfileRouterProtocol {
    /// Ir a la pantalla de editar perfil
    /// - Parameter data: Datos del usuario
    func editUserProfileRouter(data: DataUserProfile) {
        let editUser = SABEditProfileRouter(data: data).view
        self.view.navigationController?.pushViewController(editUser, animated: true)
    }
    
}

