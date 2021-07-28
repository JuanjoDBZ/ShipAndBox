//
//  SABCoOwnerRouter.swift
//  ShipAndBox
//
//  Created by IsitaFS003 on 21/07/21.
//  
//

import Foundation
import UIKit

class SABCoOwnerRouter {
    public var view: SABCoOwnerVC
    private var presenter: SABCoOwnerPresenter
    private var interactor: SABCoOwnerInteractor
    private var window: UIWindow?    
    init() {
        self.view = SABCoOwnerVC()
        self.presenter = SABCoOwnerPresenter()
        self.interactor = SABCoOwnerInteractor()
        view.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
        interactor.presenter = self.presenter
    }
}
extension SABCoOwnerRouter: SABCoOwnerRouterProtocol {
    func createNewCoOwner() {
        let newCoOwner = SABNewCoOwnerRouter().view
        self.view.navigationController?.pushViewController(newCoOwner, animated: true)
    }
}
